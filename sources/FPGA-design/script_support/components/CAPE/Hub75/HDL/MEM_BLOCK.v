///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: MEM_BLOCK.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// Memory block for a LED matrix panel
// Memory is arrange as one LSRAM per bit plane and contains all 32 rows for up to 8 panels wide
// The second half of the panel for the same bit plane is contained in another LSRAM allowing
// simultaneous read out of upper and lower lines
// Since we only use RGB565 colours then 5 bit planes are used for red, 6 for green and 5 for blue
// This is 16 LSRAMs for the upper half of the display and another 16 LSRAMs for the lower half
// The rd_bit_plane input is used to select which bit plane [7:2] is output.
// Red and Blue bit planes [2] are tied to zero because they are only 5 bits.
// Bit planes 1|0 are tied to zero for RGB.
//
// Targeted device: <Family::PolarFireSoC> <Die::MPFS025T> <Package::FCVG484>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns / 100ps

module MEM_BLOCK(
    input           clk,
    input           led_clk,
    input           resetn,
    
    input           wr_en,
    input           rd_en,
    input [14:0]    addr_a,             // address for (64x8 columns) x (64 rows)
    input [15:0]    wr_data,            // RGB565 write pixel data
    output reg [15:0]   rd_data,        // RGB565 read pixel data
    
    input [13:0]    rd_addr,            // address for (64x8 columns) x (32 rows) row_n and row_n+32 always output
    input [2:0]     rd_bit_plane,       // select active bit plane to output [7:2] ,outputs RGB(N) + RGB(N+32)
    output reg      r0, g0, b0,
    output reg      r1, g1, b1
);

localparam NR = 5, NG = 6, NB = 5;

// colours broken out into bits
wire [NR - 1:0] wr_red;
wire [NG - 1:0] wr_green;
wire [NB - 1:0] wr_blue;
wire upper_panel_wr_en, lower_panel_wr_en;
wire upper_panel_rd_en, lower_panel_rd_en;
wire [NR - 1:0] upper_rd_red;
wire [NG - 1:0] upper_rd_green;
wire [NB - 1:0] upper_rd_blue;
wire [NR - 1:0] lower_rd_red;
wire [NG - 1:0] lower_rd_green;
wire [NB - 1:0] lower_rd_blue;
wire [NR - 1:0] r0_bp, r1_bp;  // output bits from the red bit planes
wire [NG - 1:0] g0_bp, g1_bp;  // output bits from the green bit planes
wire [NB - 1:0] b0_bp, b1_bp;  // output bits from the blue bit planes

// assignments
assign wr_red = wr_data[4:0];
assign wr_green = wr_data[10:5];
assign wr_blue = wr_data[15:11];
assign upper_panel_wr_en = ~addr_a[14] & wr_en;
assign lower_panel_wr_en = addr_a[14] & wr_en;
assign upper_panel_rd_en = ~addr_a[14] & rd_en;
assign lower_panel_rd_en = addr_a[14] & rd_en;
// allow for pipeline delays
reg upper_rd_pending;
reg lower_rd_pending;

// multiplexer to select bit plane output based upon selected plane
always @(*)begin
    case (rd_bit_plane)
        3'b000: begin r0 <= 1'b0;     g0 <= 1'b0;     b0 <= 1'b0;     r1 <= 1'b0;     g1 <= 1'b0;     b1 <= 1'b0;     end
        3'b001: begin r0 <= 1'b0;     g0 <= 1'b0;     b0 <= 1'b0;     r1 <= 1'b0;     g1 <= 1'b0;     b1 <= 1'b0;     end
        3'b010: begin r0 <= 1'b0;     g0 <= g0_bp[0]; b0 <= 1'b0;     r1 <= 1'b0;     g1 <= g1_bp[0]; b1 <= 1'b0;     end
        3'b011: begin r0 <= r0_bp[0]; g0 <= g0_bp[1]; b0 <= b0_bp[0]; r1 <= r1_bp[0]; g1 <= g1_bp[1]; b1 <= b1_bp[0]; end       
        3'b100: begin r0 <= r0_bp[1]; g0 <= g0_bp[2]; b0 <= b0_bp[1]; r1 <= r1_bp[1]; g1 <= g1_bp[2]; b1 <= b1_bp[1]; end 
        3'b101: begin r0 <= r0_bp[2]; g0 <= g0_bp[3]; b0 <= b0_bp[2]; r1 <= r1_bp[2]; g1 <= g1_bp[3]; b1 <= b1_bp[2]; end        
        3'b110: begin r0 <= r0_bp[3]; g0 <= g0_bp[4]; b0 <= b0_bp[3]; r1 <= r1_bp[3]; g1 <= g1_bp[4]; b1 <= b1_bp[3]; end
        3'b111: begin r0 <= r0_bp[4]; g0 <= g0_bp[5]; b0 <= b0_bp[4]; r1 <= r1_bp[4]; g1 <= g1_bp[5]; b1 <= b1_bp[4]; end    
    endcase    
end

// select and form the output from the framebuffer memory
always @(posedge clk or negedge resetn)
begin
    if (resetn == 1'b0) begin
        // reset module
        rd_data <= 16'h0000;
        upper_rd_pending <= 1'b0;
        lower_rd_pending <= 1'b0;
    end else begin
        if (rd_en == 1'b1) begin
            if (addr_a[14] == 1'b0) begin
                // read of upper block
                upper_rd_pending <= 1'b1;
            end else begin
                // read of lower block
                lower_rd_pending <= 1'b1;
            end    
        end

        if (upper_rd_pending == 1'b1) begin
            rd_data <= {upper_rd_blue[4:0], upper_rd_green[5:0], upper_rd_red[4:0]};
            upper_rd_pending <= 1'b0;
        end

        if (lower_rd_pending == 1'b1) begin
            rd_data <= {lower_rd_blue[4:0], lower_rd_green[5:0], lower_rd_red[4:0]};
            lower_rd_pending <= 1'b0;
        end
    end
end

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// UPPER BIT PLANES
// Each MEM_BIT_PLANE contains 16384x1bit value representing each bit of the display for that colour
// for the RED colour generate 5 bit planes for the upper half of the display
genvar upper_red_idx;
generate
    for(upper_red_idx = 0; upper_red_idx < NR; upper_red_idx = upper_red_idx + 1) begin : red_plane0_inst
        MEM_BIT_PLANE2 red_plane0 (
            .clk_a(clk),
            .w_en_a(upper_panel_wr_en),
            .r_en_a(upper_panel_rd_en),
            .addr_a(addr_a[13:0]),
            .w_data_a(wr_red[upper_red_idx]),
            .r_data_a(upper_rd_red[upper_red_idx]),
            
            .clk_b(led_clk),
            .w_en_b(1'b0),
            .addr_b(rd_addr),
            .w_data_b(1'b0),
            .r_data_b(r0_bp[upper_red_idx])
        );
    end
endgenerate

// for the GREEN colour generate 6 bit planes for the upper half of the display
genvar upper_green_idx;
generate
    for(upper_green_idx = 0; upper_green_idx < NG; upper_green_idx = upper_green_idx + 1) begin : green_plane0_inst
        MEM_BIT_PLANE2 green_plane0 (
            .clk_a(clk),
            .w_en_a(upper_panel_wr_en),
            .r_en_a(upper_panel_rd_en),
            .addr_a(addr_a[13:0]),
            .w_data_a(wr_green[upper_green_idx]),
            .r_data_a(upper_rd_green[upper_green_idx]),
            
            .clk_b(led_clk),
            .w_en_b(1'b0),
            .addr_b(rd_addr),
            .w_data_b(1'b0),
            .r_data_b(g0_bp[upper_green_idx])
        );
    end
endgenerate

// for the BLUE colour generate 5 bit planes for the upper half of the display
genvar upper_blue_idx;
generate
    for(upper_blue_idx = 0; upper_blue_idx < NB; upper_blue_idx = upper_blue_idx + 1) begin : blue_plane0_inst
        MEM_BIT_PLANE2 blue_plane0 (
            .clk_a(clk),
            .w_en_a(upper_panel_wr_en),
            .r_en_a(upper_panel_rd_en),
            .addr_a(addr_a[13:0]),
            .w_data_a(wr_blue[upper_blue_idx]),
            .r_data_a(upper_rd_blue[upper_blue_idx]),
            
            .clk_b(led_clk),
            .w_en_b(1'b0),
            .addr_b(rd_addr),
            .w_data_b(1'b0),
            .r_data_b(b0_bp[upper_blue_idx])        
        );
    end
endgenerate

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// LOWER BIT PLANES
// Each MEM_BIT_PLANE contains 16384x1bit value representing each bit of the display for that colour
// for the RED colour generate 5 bit planes for the lower half of the display
genvar lower_red_idx;
generate
    for(lower_red_idx = 0; lower_red_idx < NR; lower_red_idx = lower_red_idx + 1) begin : red_plane1_inst
        MEM_BIT_PLANE2 red_plane1 (
            .clk_a(clk),
            .w_en_a(lower_panel_wr_en),
            .r_en_a(lower_panel_rd_en),
            .addr_a(addr_a[13:0]),
            .w_data_a(wr_red[lower_red_idx]),
            .r_data_a(lower_rd_red[lower_red_idx]),
            
            .clk_b(led_clk),
            .w_en_b(1'b0),
            .addr_b(rd_addr),
            .w_data_b(1'b0),
            .r_data_b(r1_bp[lower_red_idx])           
        );
    end
endgenerate

// for the GREEN colour generate 6 bit planes for the lower half of the display
genvar lower_green_idx;
generate
    for(lower_green_idx = 0; lower_green_idx < NG; lower_green_idx = lower_green_idx + 1) begin : green_plane1_inst
        MEM_BIT_PLANE2 green_plane1 (
            .clk_a(clk),
            .w_en_a(lower_panel_wr_en),
            .r_en_a(lower_panel_rd_en),
            .addr_a(addr_a[13:0]),
            .w_data_a(wr_green[lower_green_idx]),
            .r_data_a(lower_rd_green[lower_green_idx]),
            
            .clk_b(led_clk),
            .w_en_b(1'b0),
            .addr_b(rd_addr),
            .w_data_b(1'b0),
            .r_data_b(g1_bp[lower_green_idx])            
        );
    end
endgenerate

// for the BLUE colour generate 5 bit planes for the lower half of the display
genvar lower_blue_idx;
generate
    for(lower_blue_idx = 0; lower_blue_idx < NB; lower_blue_idx = lower_blue_idx + 1) begin : blue_plane1_inst
        MEM_BIT_PLANE2 blue_plane1 (
            .clk_a(clk),
            .w_en_a(lower_panel_wr_en),
            .r_en_a(lower_panel_rd_en),
            .addr_a(addr_a[13:0]),
            .w_data_a(wr_blue[lower_blue_idx]),
            .r_data_a(lower_rd_blue[lower_blue_idx]),

            .clk_b(led_clk),
            .w_en_b(1'b0),
            .addr_b(rd_addr),
            .w_data_b(1'b0),
            .r_data_b(b1_bp[lower_blue_idx])                
        );
    end
endgenerate


endmodule

