//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Dec  3 10:18:21 2023
// Version: 2022.3 2022.3.0.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// CAPE
module CAPE(
    // Inputs
    APB_SLAVE_SLAVE_PADDR,
    APB_SLAVE_SLAVE_PENABLE,
    APB_SLAVE_SLAVE_PSEL,
    APB_SLAVE_SLAVE_PWDATA,
    APB_SLAVE_SLAVE_PWRITE,
    GPIO_OE,
    GPIO_OUT,
    PCLK,
    PRESETN,
    // Outputs
    APB_SLAVE_SLAVE_PRDATA,
    GPIO_IN,
    INT_A,
    INT_B,
    INT_C,
    // Inouts
    P8_3,
    P8_4,
    P8_5,
    P8_6,
    P8_7,
    P8_8,
    P8_9,
    P8_10,
    P8_11,
    P8_12,
    P8_13,
    P8_14,
    P8_15,
    P8_16,
    P8_17,
    P8_18,
    P8_19,
    P8_20,
    P8_21,
    P8_22,
    P8_23,
    P8_24,
    P8_25,
    P8_26,
    P8_27,
    P8_28,
    P8_29,
    P8_30,
    P8_31,
    P8_32,
    P8_33,
    P8_34,
    P8_35,
    P8_36,
    P8_37,
    P8_38,
    P8_39,
    P8_40,
    P8_41,
    P8_42,
    P8_43,
    P8_44,
    P8_45,
    P8_46,
    P9_11,
    P9_12,
    P9_13,
    P9_14,
    P9_15,
    P9_16,
    P9_17,
    P9_18,
    P9_21,
    P9_22,
    P9_23,
    P9_24,
    P9_25,
    P9_26,
    P9_27,
    P9_28,
    P9_29,
    P9_30,
    P9_31,
    P9_41,
    P9_42
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [31:0] APB_SLAVE_SLAVE_PADDR;
input         APB_SLAVE_SLAVE_PENABLE;
input         APB_SLAVE_SLAVE_PSEL;
input  [31:0] APB_SLAVE_SLAVE_PWDATA;
input         APB_SLAVE_SLAVE_PWRITE;
input  [27:0] GPIO_OE;
input  [27:0] GPIO_OUT;
input         PCLK;
input         PRESETN;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] APB_SLAVE_SLAVE_PRDATA;
output [27:0] GPIO_IN;
output [7:0] INT_A;
output [7:0] INT_B;
output [7:0] INT_C;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         P8_3;
inout         P8_4;
inout         P8_5;
inout         P8_6;
inout         P8_7;
inout         P8_8;
inout         P8_9;
inout         P8_10;
inout         P8_11;
inout         P8_12;
inout         P8_13;
inout         P8_14;
inout         P8_15;
inout         P8_16;
inout         P8_17;
inout         P8_18;
inout         P8_19;
inout         P8_20;
inout         P8_21;
inout         P8_22;
inout         P8_23;
inout         P8_24;
inout         P8_25;
inout         P8_26;
inout         P8_27;
inout         P8_28;
inout         P8_29;
inout         P8_30;
inout         P8_31;
inout         P8_32;
inout         P8_33;
inout         P8_34;
inout         P8_35;
inout         P8_36;
inout         P8_37;
inout         P8_38;
inout         P8_39;
inout         P8_40;
inout         P8_41;
inout         P8_42;
inout         P8_43;
inout         P8_44;
inout         P8_45;
inout         P8_46;
inout         P9_11;
inout         P9_12;
inout         P9_13;
inout         P9_14;
inout         P9_15;
inout         P9_16;
inout         P9_17;
inout         P9_18;
inout         P9_21;
inout         P9_22;
inout         P9_23;
inout         P9_24;
inout         P9_25;
inout         P9_26;
inout         P9_27;
inout         P9_28;
inout         P9_29;
inout         P9_30;
inout         P9_31;
inout         P9_41;
inout         P9_42;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [31:0]  apb_ctrl_status_0_control;
wire           APB_SLAVE_SLAVE_PENABLE;
wire   [31:0]  APB_SLAVE_PRDATA;
wire           APB_SLAVE_SLAVE_PSEL;
wire   [31:0]  APB_SLAVE_SLAVE_PWDATA;
wire           APB_SLAVE_SLAVE_PWRITE;
wire   [30:3]  GPIO_IN_net_0;
wire   [27:0]  GPIO_OE;
wire   [27:0]  GPIO_OUT;
wire           P8_3;
wire           P8_4;
wire           P8_5;
wire           P8_6;
wire           P8_7;
wire           P8_8;
wire           P8_9;
wire           P8_10;
wire           P8_11;
wire           P8_12;
wire           P8_13;
wire           P8_14;
wire           P8_15;
wire           P8_16;
wire           P8_17;
wire           P8_18;
wire           P8_19;
wire           P8_20;
wire           P8_21;
wire           P8_22;
wire           P8_23;
wire           P8_24;
wire           P8_25;
wire           P8_26;
wire           P8_27;
wire           P8_28;
wire           P8_29;
wire           P8_30;
wire           P8_31;
wire           P8_32;
wire           P8_33;
wire           P8_34;
wire           P8_35;
wire           P8_36;
wire           P8_37;
wire           P8_38;
wire           P8_39;
wire           P8_40;
wire           P8_41;
wire           P8_42;
wire           P8_43;
wire           P8_44;
wire           P8_45;
wire           P8_46;
wire           P9_11;
wire           P9_12;
wire           P9_13;
wire           P9_14;
wire           P9_15;
wire           P9_16;
wire           P9_17;
wire           P9_18;
wire           P9_21;
wire           P9_22;
wire           P9_23;
wire           P9_24;
wire           P9_25;
wire           P9_26;
wire           P9_27;
wire           P9_28;
wire           P9_29;
wire           P9_30;
wire           P9_31;
wire           P9_41;
wire           P9_42;
wire           PCLK;
wire           PRESETN;
wire	       BLINK;
wire   [31:0]  APB_SLAVE_PRDATA_net_0;
wire   [27:0]  GPIO_IN_net_1;
wire   [46:31] GPIO_IN_slice_0;
wire   [46:3]  GPIO_OE_net_0;
wire   [46:3]  GPIO_OUT_net_0;
wire   [46:3]  GPIO_IN_net_2;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [46:31] GPIO_OE_const_net_0;
wire   [46:31] GPIO_OUT_const_net_0;
wire   [18:11] GPIO_OE_const_net_1;
wire   [18:11] GPIO_OUT_const_net_1;
wire   [31:21] GPIO_OE_const_net_2;
wire   [31:21] GPIO_OUT_const_net_2;
wire   [42:41] GPIO_OE_const_net_3;
wire   [42:41] GPIO_OUT_const_net_3;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [31:0]  APB_SLAVE_SLAVE_PADDR;
wire   [17:0]  APB_SLAVE_SLAVE_PADDR_0;
wire   [17:0]  APB_SLAVE_SLAVE_PADDR_0_17to0;

//--------------------------------------------------------------------
// HUB75
//--------------------------------------------------------------------
wire        r0_out;
wire        g0_out;
wire        b0_out;
wire        r1_out;
wire        g1_out;
wire        b1_out;
wire        led_clk_out;
wire        led_oe_out;
wire        led_latch_out;
wire [4:0]  abcde_out;
wire        mem_wr;
wire        mem_rd;
wire [15:0] mem_wdata;
wire [14:0] mem_addr;
wire [15:0] mem_rdata;
wire [9:0]  pixels_per_row;
wire [13:0] BCM_count[0:5];
wire        frame_sync_out;
wire        rd_valid_out;
wire        LED_CLK;

//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GPIO_OE_const_net_0  = 16'h0000;
assign GPIO_OUT_const_net_0 = 16'h0000;
assign GPIO_OE_const_net_1  = 8'h00;
assign GPIO_OUT_const_net_1 = 8'h00;
assign GPIO_OE_const_net_2  = 11'h000;
assign GPIO_OUT_const_net_2 = 11'h000;
assign GPIO_OE_const_net_3  = 2'h0;
assign GPIO_OUT_const_net_3 = 2'h0;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign INT_A[7:0]                    = 8'h00;
assign INT_B[7:0]                    = 8'h00;
assign INT_C[7:0]                    = 8'h00;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign APB_SLAVE_PRDATA_net_0       = APB_SLAVE_PRDATA;
assign APB_SLAVE_SLAVE_PRDATA[31:0] = APB_SLAVE_PRDATA_net_0;
assign GPIO_IN_net_1                = GPIO_IN_net_0;
assign GPIO_IN[27:0]                = GPIO_IN_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign GPIO_IN_net_0   = GPIO_IN_net_2[30:3];
assign GPIO_IN_slice_0 = GPIO_IN_net_2[46:31];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign GPIO_OE_net_0 = { 16'hFFFF, GPIO_OE[27:6], 1'b1, GPIO_OE[4:4], 4'b1111 };
assign GPIO_OUT_net_0 = { 1'b0, led_oe_out, led_latch_out, led_clk_out,
                          abcde_out[3], abcde_out[2], abcde_out[1], abcde_out[0],
                          abcde_out[4], b1_out, g1_out, r1_out,
                          1'b0, b0_out, g0_out, r0_out,
                          GPIO_OUT[27:6], APB_SLAVE_SLAVE_PSEL, GPIO_OUT[4:4], 
                          APB_SLAVE_SLAVE_PWRITE, mem_wr, led_clk_out, frame_sync_out};

//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign APB_SLAVE_SLAVE_PADDR_0 = { APB_SLAVE_SLAVE_PADDR_0_17to0 };
assign APB_SLAVE_SLAVE_PADDR_0_17to0 = APB_SLAVE_SLAVE_PADDR[17:0];

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------apb_ctrl_status
apb_ctrl_status apb_ctrl_status_0(
        // Inputs
        .presetn ( PRESETN ),
        .pclk    ( PCLK ),
        .psel    ( APB_SLAVE_SLAVE_PSEL ),
        .penable ( APB_SLAVE_SLAVE_PENABLE ),
        .pwrite  ( APB_SLAVE_SLAVE_PWRITE ),
        .paddr   ( APB_SLAVE_SLAVE_PADDR_0 ),
        .pwdata  ( APB_SLAVE_SLAVE_PWDATA ),
        
        // Outputs
        .prdata  ( APB_SLAVE_PRDATA ),
        .control ( apb_ctrl_status_0_control ),
        .pixels_per_row(pixels_per_row),
        .BCM_count( BCM_count ),

        .mem_wr  (mem_wr),
        .mem_rd  (mem_rd),
        .mem_wdata (mem_wdata),
        .mem_addr (mem_addr),
        .mem_rdata (mem_rdata)         
        );

//--------P8_IOPADS
P8_IOPADS P8_IOPADS_0(
        // Inputs
        .GPIO_OE  ( GPIO_OE_net_0 ),
        .GPIO_OUT ( GPIO_OUT_net_0 ),
        // Outputs
        .GPIO_IN  ( GPIO_IN_net_2 ),
        // Inouts
        .P8_3     ( P8_3 ),
        .P8_4     ( P8_4 ),
        .P8_5     ( P8_5 ),
        .P8_6     ( P8_6 ),
        .P8_7     ( P8_7 ),
        .P8_8     ( P8_8 ),
        .P8_9     ( P8_9 ),
        .P8_10    ( P8_10 ),
        .P8_11    ( P8_11 ),
        .P8_12    ( P8_12 ),
        .P8_13    ( P8_13 ),
        .P8_14    ( P8_14 ),
        .P8_15    ( P8_15 ),
        .P8_16    ( P8_16 ),
        .P8_17    ( P8_17 ),
        .P8_18    ( P8_18 ),
        .P8_19    ( P8_19 ),
        .P8_20    ( P8_20 ),
        .P8_21    ( P8_21 ),
        .P8_22    ( P8_22 ),
        .P8_23    ( P8_23 ),
        .P8_24    ( P8_24 ),
        .P8_25    ( P8_25 ),
        .P8_26    ( P8_26 ),
        .P8_27    ( P8_27 ),
        .P8_28    ( P8_28 ),
        .P8_29    ( P8_29 ),
        .P8_30    ( P8_30 ),
        .P8_31    ( P8_31 ),
        .P8_32    ( P8_32 ),
        .P8_33    ( P8_33 ),
        .P8_34    ( P8_34 ),
        .P8_35    ( P8_35 ),
        .P8_36    ( P8_36 ),
        .P8_37    ( P8_37 ),
        .P8_38    ( P8_38 ),
        .P8_39    ( P8_39 ),
        .P8_40    ( P8_40 ),
        .P8_41    ( P8_41 ),
        .P8_42    ( P8_42 ),
        .P8_43    ( P8_43 ),
        .P8_44    ( P8_44 ),
        .P8_45    ( P8_45 ),
        .P8_46    ( P8_46 )
        );

//--------P9_11_18_IOPADS
P9_11_18_IOPADS P9_11_18_IOPADS_0(
        // Inputs
        .GPIO_OE  ( GPIO_OE_const_net_1 ),
        .GPIO_OUT ( GPIO_OUT_const_net_1 ),
        // Outputs
        .GPIO_IN  (  ),
        // Inouts
        .P9_11    ( P9_11 ),
        .P9_12    ( P9_12 ),
        .P9_13    ( P9_13 ),
        .P9_14    ( P9_14 ),
        .P9_15    ( P9_15 ),
        .P9_16    ( P9_16 ),
        .P9_17    ( P9_17 ),
        .P9_18    ( P9_18 ) 
        );

//--------P9_21_31_IOPADS
P9_21_31_IOPADS P9_21_31_IOPADS_0(
        // Inputs
        .GPIO_OE  ( GPIO_OE_const_net_2 ),
        .GPIO_OUT ( GPIO_OUT_const_net_2 ),
        // Outputs
        .GPIO_IN  (  ),
        // Inouts
        .P9_21    ( P9_21 ),
        .P9_22    ( P9_22 ),
        .P9_23    ( P9_23 ),
        .P9_24    ( P9_24 ),
        .P9_25    ( P9_25 ),
        .P9_26    ( P9_26 ),
        .P9_27    ( P9_27 ),
        .P9_28    ( P9_28 ),
        .P9_29    ( P9_29 ),
        .P9_30    ( P9_30 ),
        .P9_31    ( P9_31 ) 
        );

//--------P9_41_42_IOPADS
P9_41_42_IOPADS P9_41_42_IOPADS_0(
        // Inputs
        .GPIO_OE  ( GPIO_OE_const_net_3 ),
        .GPIO_OUT ( GPIO_OUT_const_net_3 ),
        // Outputs
        .GPIO_IN  (  ),
        // Inouts
        .P9_41    ( P9_41 ),
        .P9_42    ( P9_42 ) 
        );

//--------blinky
blinky blinky_0(                //
        .clk     ( PCLK ),      //
        .resetn  ( PRESETN ),   //
        .blink   ( BLINK )      //
        );

// LED clock generation
LED_CCC led_ccc_0(
    .clk(PCLK),
    .led_clk(LED_CLK)
);

//HUB75 driver module
H75_MODULE h75_module_0(
    .clk(PCLK),
    .led_clk_in(LED_CLK),
    .resetn(PRESETN),
    
    // control inputs
    .gen_timing(apb_ctrl_status_0_control[0]),
    .test_pattern(apb_ctrl_status_0_control[1]),
    .pixels_per_row(pixels_per_row),        
    .BCM_count( BCM_count),
    
    // memory interface allowing writes of memory
    .mem_wr_en(mem_wr),
    .mem_rd_en(mem_rd),
    .mem_addr(mem_addr),
    .mem_wr_data(mem_wdata),  
    .mem_rd_data(mem_rdata),  

    // Latch and output enable signals for the display module
    .plane_oe(led_oe_out),
    .latch_enable(led_latch_out),
    .led_clk_out(led_clk_out),
    
    // Row and data signals 
    .ABCDE(abcde_out),  
    .r0(r0_out), 
    .g0(g0_out), 
    .b0(b0_out),
    .r1(r1_out), 
    .g1(g1_out), 
    .b1(b1_out),
    
    .frame_sync(frame_sync_out),
    .rd_valid(rd_valid_out)
);


endmodule
