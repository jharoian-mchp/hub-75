///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: MEM_TEST_PATTERN.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFireSoC> <Die::MPFS025T> <Package::FCVG484>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns / 100ps

module MEM_TEST_PATTERN (
    input           clk,
    input           led_clk,
    input           resetn,
    
    input [13:0]    rd_addr,            // address for (64x8 columns) x (32 rows) row_n and row_n+32 always output
    input [2:0]     rd_bit_plane,       // select active bit plane to output [7:2] ,outputs RGB(N) + RGB(N+32)
    
    output reg      r0, g0, b0,
    output reg      r1, g1, b1
);

// for test setup use RGB666
// these outputs are one clock delayed from the ones below to emulate the
// LSRAM pipeline delays
reg [5:0] r0_bp, r1_bp;  // output bits from the red bit planes
reg [5:0] g0_bp, g1_bp;  // output bits from the green bit planes
reg [5:0] b0_bp, b1_bp;  // output bits from the blue bit planes
// initial values
reg [5:0] r0_bp_t, r1_bp_t; 
reg [5:0] g0_bp_t, g1_bp_t;
reg [5:0] b0_bp_t, b1_bp_t; 


wire [1:0] x = rd_addr[4:3];
wire [1:0] y = rd_addr[13:12];

// multiplexer to select bit plane output based upon selected plane
always @(*)begin
    case (rd_bit_plane)
        3'b000: begin r0 <= 1'b0;     g0 <= 1'b0;     b0 <= 1'b0;     r1 <= 1'b0;     g1 <= 1'b0;     b1 <= 1'b0;     end
        3'b001: begin r0 <= 1'b0;     g0 <= 1'b0;     b0 <= 1'b0;     r1 <= 1'b0;     g1 <= 1'b0;     b1 <= 1'b0;     end
        3'b010: begin r0 <= r0_bp[0]; g0 <= g0_bp[0]; b0 <= b0_bp[0]; r1 <= r1_bp[0]; g1 <= g1_bp[0]; b1 <= b1_bp[0]; end
        3'b011: begin r0 <= r0_bp[1]; g0 <= g0_bp[1]; b0 <= b0_bp[1]; r1 <= r1_bp[1]; g1 <= g1_bp[1]; b1 <= b1_bp[1]; end       
        3'b100: begin r0 <= r0_bp[2]; g0 <= g0_bp[2]; b0 <= b0_bp[2]; r1 <= r1_bp[2]; g1 <= g1_bp[2]; b1 <= b1_bp[2]; end 
        3'b101: begin r0 <= r0_bp[3]; g0 <= g0_bp[3]; b0 <= b0_bp[3]; r1 <= r1_bp[3]; g1 <= g1_bp[3]; b1 <= b1_bp[3]; end        
        3'b110: begin r0 <= r0_bp[4]; g0 <= g0_bp[4]; b0 <= b0_bp[4]; r1 <= r1_bp[4]; g1 <= g1_bp[4]; b1 <= b1_bp[4]; end
        3'b111: begin r0 <= r0_bp[5]; g0 <= g0_bp[5]; b0 <= b0_bp[5]; r1 <= r1_bp[5]; g1 <= g1_bp[5]; b1 <= b1_bp[5]; end    
    endcase    
end

always @(posedge led_clk or negedge resetn) begin
    if (resetn == 1'b0) begin
        // perform module reset
    end else begin
        // copy the previous values to the output registers to emulate pipeline delay in LSRAMs
        r0_bp <= r0_bp_t; g0_bp <= g0_bp_t; b0_bp <= b0_bp_t;
        r1_bp <= r1_bp_t; g1_bp <= g1_bp_t; b1_bp <= b1_bp_t;

        case((x + y) % 4)
            2'b00: // black
                begin
                    r0_bp_t <= 6'b000000; g0_bp_t <= 6'b000000; b0_bp_t <= 6'b000000;
                    r1_bp_t <= 6'b000000; g1_bp_t <= 6'b000000; b1_bp_t <= 6'b000000;
                end
            2'b01: // red
                begin
                    r0_bp_t <= 6'b111111; g0_bp_t <= 6'b000000; b0_bp_t <= 6'b000000;
                    r1_bp_t <= 6'b111111; g1_bp_t <= 6'b000000; b1_bp_t <= 6'b000000;
                end
            2'b10: // green
                begin
                    r0_bp_t <= 6'b000000; g0_bp_t <= 6'b111111; b0_bp_t <= 6'b000000;
                    r1_bp_t <= 6'b000000; g1_bp_t <= 6'b111111; b1_bp_t <= 6'b000000;
                end
            2'b11: // blue
                begin
                    r0_bp_t <= 6'b000000; g0_bp_t <= 6'b000000; b0_bp_t <= 6'b111111;
                    r1_bp_t <= 6'b000000; g1_bp_t <= 6'b000000; b1_bp_t <= 6'b111111;
                end
            default:
                begin
                    r0_bp_t <= 6'b000000; g0_bp_t <= 6'b000000; b0_bp_t <= 6'b000000;
                    r1_bp_t <= 6'b000000; g1_bp_t <= 6'b000000; b1_bp_t <= 6'b000000;
                end
        endcase
    end
end;


endmodule

