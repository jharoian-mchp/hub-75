///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: H75_MODULE.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// Top level block for HUB75
//
// Targeted device: <Family::PolarFireSoC> <Die::MPFS025T> <Package::FCVG484>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns / 100ps

module H75_MODULE(
    input           clk,
    input           resetn,
    
    input           gen_timing,         // control generation of timing signals
    input [8:0]     pixels_per_row,     // number of pixels per row
    
    // memory interface allowing APB writes to framebuffer memory
    input           wr_en,
    input [14:0]    wr_addr,
    input [31:0]    wr_data,
    
    // output and output enables signals for the display module
    output wire     plane_oe,
    output wire     latch_enable,
    output wire     led_clk,
    
    // row and data signals
    output wire [4:0]   ABCDE,
    output wire     r0,
    output wire     g0,
    output wire     b0,
    output wire     r1,
    output wire     g1,
    output wire     b1,
    
    // diagnostics
    output wire     frame_sync,
    output wire     rd_valid
);

//localparam DEFAULT_ROW_LENGTH = 16;
//reg [8:0] PIXELS_PER_ROW;

wire PLANE_OE_int;
wire [2:0] PLANE_int;
wire LATCH_ENABLE_int;
wire FRAME_SYNC_int;
wire [4:0] ABCDE_int;
wire [13:0] RD_ADDR_int;
wire RD_VALID_int;
wire LED_CLK_int;

assign plane_oe = PLANE_OE_int;
assign latch_enable = LATCH_ENABLE_int;
assign ABCDE = ABCDE_int;
assign frame_sync = FRAME_SYNC_int;
assign led_clk = LED_CLK_int;
assign rd_valid = RD_VALID_int;

always @(posedge clk) begin
    if (resetn == 1'b0) begin
        // reset module
//        PIXELS_PER_ROW <= DEFAULT_ROW_LENGTH;
    end else begin
    end
end

// instantiate the timing block
H75_TIMING_GENERATOR timing_gen_0 (
    .clk(clk),
    .resetn(resetn),
    .gen_timing(1'b1),
    .pixels_per_row(pixels_per_row),    
    
    .frame_sync(FRAME_SYNC_int),
    .oe(PLANE_OE_int),
    .plane(PLANE_int),
    .latch_enable(LATCH_ENABLE_int),
    .rd_addr(RD_ADDR_int),
    .led_clk(LED_CLK_int),
    .ABCDE(ABCDE_int),    
    .rd_valid(RD_VALID_int)
);

// instantiate the memory block
MEM_BLOCK mem_block_0 (
    .clk(clk),
    .resetn(resetn),
    
    .wr_en(wr_en),
    .wr_addr(wr_addr),
    .wr_data(wr_data[15:0]),
    .rd_addr(RD_ADDR_int),
    .rd_bit_plane(PLANE_int),
    
    .r0(r0), .g0(g0), .b0(b0),
    .r1(r1), .g1(g1), .b1(b1)
);

endmodule

