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
    input           clk,                // 50MHz clock for memory side interface
    input           led_clk_in,         // 30MHz for LED interface
    input           resetn,
    
    input           gen_timing,         // control generation of timing signals
    input           test_pattern,       // generate test pattern
    input [9:0]     pixels_per_row,     // number of pixels per row
    input [13:0]    BCM_count[0:5],     // timing valus for BCM
    
    // memory interface allowing APB writes to framebuffer memory
    input           wr_en,
    input [14:0]    wr_addr,
    input [15:0]    wr_data,
    
    // output and output enables signals for the display module
    output wire     plane_oe,
    output wire     latch_enable,
    output wire     led_clk_out,
    
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

wire PLANE_OE_int;
wire [2:0] PLANE_int;
wire LATCH_ENABLE_int;
wire FRAME_SYNC_int;
wire [4:0] ABCDE_int;
wire [13:0] RD_ADDR_int;
wire RD_VALID_int;
wire LED_CLK_int;
wire r0_mem, g0_mem, b0_mem;
wire r1_mem, g1_mem, b1_mem;
wire r0_test, g0_test, b0_test;
wire r1_test, g1_test, b1_test;

assign plane_oe = PLANE_OE_int;
assign latch_enable = LATCH_ENABLE_int;
assign ABCDE = ABCDE_int;
assign frame_sync = FRAME_SYNC_int;
assign led_clk_out = LED_CLK_int;
assign rd_valid = RD_VALID_int;

assign r0 = (test_pattern == 1'b1) ? r0_test : r0_mem;
assign g0 = (test_pattern == 1'b1) ? g0_test : g0_mem;
assign b0 = (test_pattern == 1'b1) ? b0_test : b0_mem;
assign r1 = (test_pattern == 1'b1) ? r1_test : r1_mem;
assign g1 = (test_pattern == 1'b1) ? g1_test : g1_mem;
assign b1 = (test_pattern == 1'b1) ? b1_test : b1_mem;

always @(posedge clk) begin
    if (resetn == 1'b0) begin
        // reset module
    end else begin
    end
end

// instantiate the timing block
H75_TIMING_GENERATOR timing_gen_0 (
    .clk(led_clk_in),
    .resetn(resetn),
    .gen_timing(gen_timing),
    .pixels_per_row(pixels_per_row), 
    .BCM_count(BCM_count),   
    
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
    .led_clk(led_clk_in),
    .resetn(resetn),
    
    .wr_en(wr_en),
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    .rd_addr(RD_ADDR_int),
    .rd_bit_plane(PLANE_int),
    
    .r0(r0_mem), .g0(g0_mem), .b0(b0_mem),
    .r1(r1_mem), .g1(g1_mem), .b1(b1_mem)
);

// instantiate the memory test pattern
MEM_TEST_PATTERN mem_test_pattern_0 (
    .clk(clk),
    .led_clk(led_clk_in),
    .resetn(resetn),
    
    .rd_addr(RD_ADDR_int),
    .rd_bit_plane(PLANE_int),
    
    .r0(r0_test), .g0(g0_test), .b0(b0_test),
    .r1(r1_test), .g1(g1_test), .b1(b1_test)
);

endmodule

