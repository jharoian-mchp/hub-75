///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Microchip Technology
//
// File: H75_TIMING_GENERATOR.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// Generate timing signals for a HUB75 connected display
// This module assumes panels are 64x64 and connected with up to 8 in a chain
// Frame rate at this length is likely to be low so logic is optimised for 5-6 
// (Hence ideal for a cube)
//
// Targeted device: <Family::PolarFireSoC> <Die::MPFS025T> <Package::FCVG484>
// Author: Darren Wenn
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns / 100ps

module H75_TIMING_GENERATOR( 
    input               clk,                // system clock
    input               resetn,             // active low module reset
    input               gen_timing,         // generate timing 
    input [9:0]         pixels_per_row,     // pixels per row
    input [13:0]        BCM_count[0:5],     // BCM weighted delay time
    
    // internal signals and diagnostics
    output reg          frame_sync,         // frame sync output (for diagnostics)
    output reg [2:0]    plane,              // bit plane select for memory module
    output [13:0]       rd_addr,            // read address for memory module    

    output              oe,                 // led matrix output enable (active low)
    output reg          latch_enable,       // latch clocked data
    output              led_clk,            // bit clock for leds
    output reg [4:0]    ABCDE,              // currently active row to display
    output              rd_valid            // read valid for diagnostics (includes pipeline delays)
);

localparam NUM_ROWS = 32;                   // number of rows to output
localparam BCM_FACTOR = 400;                // multiplier for bit plane position and time
localparam FRAME_START_DELAY = 4;           // delay from start of frame sync to first OE for most significant bit plane
localparam CLOCK__PERIOD_NS = 20;           // 20ns system clock going to the CAPE

// counters and registers for timing
reg [19:0]      plane_counter;              // used for timing of ON time for planes
reg [5:0]       plane_bcm;                  // BCM weighting for current plane
reg [23:0]      delay_counter;              // general purpose counter used in sequential steps
reg             plane_oe;                   // output enable for the plane (also called BLANK)
reg [8:0]       plane_x;                    // plane x position (pixel within the row)
reg [4:0]       plane_y;                    // plane y position (row)
reg             rd_valid;                   // Read valid signal (accounts for RAM pipeline delay)
reg             led_clk;                    // clock to matrix

// oe is the output enable for the LEDs, normally this will be inverted plane_oe
assign oe = ~plane_oe;
assign rd_addr = { plane_y, plane_x };

// state machine states
localparam S_IDLE = 0, S_START_DELAY = 1, S_START_PLANE = 2, S_INC_X1 = 3, S_INC_X2 = 4, S_INC_X3 = 5, S_INC_X4 = 6, 
    S_INC_X5 = 7, S_LATCH1 = 8, S_LATCH2 = 9, S_OE = 10, S_INC_ROW = 11, S_ADV_PLANE = 12, S_WAIT_FRAMESYNCN = 13;
reg [3:0] timing_state;

// the led_clk to the panels
always @(clk or rd_valid)
begin
    if (rd_valid == 1'b1) begin
        led_clk <= ~clk;
    end else begin
        led_clk <= 1'b0;
    end
end

always @(posedge clk or negedge resetn)
begin
    if (resetn == 1'b0) begin
        frame_sync <= 1'b0;
        plane_oe <= 1'b0;
        plane_counter <= 0;
        latch_enable <= 1'b0;
        rd_valid <= 1'b1;
        plane_x <= 0;
        plane_y <= 0;
        ABCDE <= 5'b00000;
        timing_state <= S_IDLE;
    end else begin
    
        // decrement plane_counter used during BCM
        if (plane_oe == 1'b1) begin
            if (plane_counter == 0) begin
                plane_oe <= 1'b0;
            end else begin
                plane_counter <= plane_counter - 1;
            end
        end
        
        case (timing_state)
            S_IDLE:
                begin
                    rd_valid <= 1'b0;
                    // idle state waiting for previous plane_oe to finish
                    if ((plane_oe == 1'b0) && (gen_timing == 1'b1)) begin
                        // start the next frame
                        frame_sync <= 1'b1;
                        latch_enable <= 1'b0;
                        delay_counter <= FRAME_START_DELAY;
                        timing_state <= S_START_DELAY;
                    end
                end
            S_START_DELAY:
                begin
                    // short delay after beginning of frame
                    if (delay_counter == 0) begin
                        frame_sync <= 1'b0;
                        plane <= 7;
                        timing_state <= S_START_PLANE;
                    end else begin
                        delay_counter <= delay_counter - 1;
                    end
                end
            S_START_PLANE:
                begin
                    rd_valid <= 1'b0;
                    plane_x <= 0;
                    plane_y <= 0;
                    timing_state <= S_INC_X1;
                end
            S_INC_X1:
                begin
                    plane_x <= plane_x + 1;
                    timing_state <= S_INC_X2;
                end
            S_INC_X2:
                begin
                    rd_valid <= 1'b1;
                    plane_x <= plane_x + 1;
                    timing_state <= S_INC_X3;
                end
            S_INC_X3:
                begin
                    if (plane_x == (pixels_per_row - 1)) begin
                        timing_state <= S_INC_X4;
                    end else begin
                        plane_x <= plane_x + 1;
                        timing_state <= S_INC_X3;
                    end
                end
            S_INC_X4:
                begin
                    timing_state <= S_INC_X5;
                end
            S_INC_X5:
                begin
                    rd_valid <= 1'b0;
                    if (plane_oe == 1'b0) begin
                        // wait for any previous oe to complete before latching new data
                        ABCDE <= plane_y;
                        timing_state <= S_LATCH1;
                    end
                end
            S_LATCH1:
                begin
                    latch_enable <= 1'b1;
                    timing_state <= S_LATCH2;
                end
            S_LATCH2:
                begin
                    latch_enable <= 1'b0;
                    timing_state <= S_OE;
                end
            S_OE:
                begin
                    plane_oe <= 1'b1;
                    // calculate bcm weighted delay time
                    // for 6 screens the time needs to be around 400 clocks.. hence the calculation (PPR * 6)
                    // this will allow sufficient output time for bit plane 2 and bit plane 7
                    plane_counter <= BCM_count[plane - 2]; // plane_bcm[5:0] * (pixels_per_row + 6);
                    timing_state <= S_INC_ROW;
                end
            S_INC_ROW:
                begin
                    if (plane_y == (NUM_ROWS - 1)) begin
                        timing_state <= S_ADV_PLANE;
                    end else begin
                        plane_x <= 0;
                        plane_y <= plane_y + 1;
                        timing_state <= S_INC_X1;
                    end
                end
            S_ADV_PLANE:
                begin
                    // go to the next plane
                    if (plane == 2) begin
                            timing_state <= S_WAIT_FRAMESYNCN;
                    end else begin
                        plane <= plane - 1;
                        timing_state <= S_START_PLANE;
                    end
                end                
            S_WAIT_FRAMESYNCN:
                // this is a legacy state from when fixed frame timing was used
                // it used to wait for frame_sync to be 0 before allowing a restart
                // (when rising edge of frame_sync was next seen)
                begin
                    latch_enable <= 1'b0;
                    timing_state <= S_IDLE;
                end
            default:
                begin
                    timing_state <= S_IDLE;
                end
        endcase
    end
end

// 3-to-8 demultipler to generare BCM modulation timescale
always @(plane) begin
    case (plane)
        7: plane_bcm <= 6'b100000;
        6: plane_bcm <= 6'b010000;
        5: plane_bcm <= 6'b001000;
        4: plane_bcm <= 6'b000100;
        3: plane_bcm <= 6'b000010;
        2: plane_bcm <= 6'b000001;
        default: plane_bcm <= 6'b000000;
    endcase
end

endmodule

