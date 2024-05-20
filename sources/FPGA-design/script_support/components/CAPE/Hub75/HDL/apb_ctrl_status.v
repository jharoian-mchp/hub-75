///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: apb_ctrl_status.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// Memory interface for control and status registers
//
// Targeted device: <Family::PolarFireSoC> <Die::MPFS025T> <Package::FCVG484>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns/100ps

module apb_ctrl_status(
    input               pclk,
    input               presetn,
    input               penable,
    input               psel,
    input               pwrite,
    input [17:0]        paddr,   // [17] [16:11 row] [10:2 column] [1:0 byte] address
    input [31:0]        pwdata,
   
    output reg [31:0]   prdata,
    output reg [31:0]   control,
    output reg [9:0]    pixels_per_row,
   
    output reg          mem_wr,
    output reg [15:0]   mem_data,
    output reg [14:0]   mem_waddr,
    
    output [15:0]       DIAG_ADDR
);

    // addresses of the control/status registers (in 32bit multiples)
    localparam [15:0] STATUS            = 16'h8000;         // Read register
    localparam [15:0] CONTROL_0         = 16'h8001;         // Read/write control register
    localparam [15:0] PPROW_0           = 16'h8002;         // Pixels per row
    
    localparam DEFAULT_CONTROL          = 32'h0000_0001;    // enable gen timing
    localparam DEFAULT_PIXELS_PER_ROW   = 10'h40;           // 64 pixels per row default (one screen)

    reg [31:0] control_value;
    reg [9:0] ppr_value;
    
    reg mem_wr_0;
    wire [15:0] mem_word_addr = paddr[17:2];                // extract the word address (32bit words)
    wire rd_enable;
    wire wr_enable;

    assign DIAG_ADDR = mem_word_addr;
    assign wr_enable = (penable && pwrite && psel);
    assign rd_enable = (!pwrite && psel);

    always@(posedge pclk or negedge presetn)
    begin
        if(~presetn) begin
            prdata <= 'b0;
            control_value <= DEFAULT_CONTROL;
            control <= DEFAULT_CONTROL;

            // pixels to render, should be multiples of 64
            ppr_value <= DEFAULT_PIXELS_PER_ROW;
            pixels_per_row <= DEFAULT_PIXELS_PER_ROW;
            
            mem_wr_0 <= 1'b0;
            
        end else begin
            case (mem_word_addr)
                STATUS:
                    begin
                        if (rd_enable) begin
                            prdata <= 32'hdeadbeef;
                        end
                    end
                CONTROL_0:
                    begin
                        if (rd_enable) begin
                            prdata <= control_value;
                        end else if (wr_enable) begin
                            control_value <= pwdata;
                            control <= pwdata;
                        end
                    end
                PPROW_0:
                    begin
                        if (rd_enable) begin
                            prdata <= ppr_value;
                        end else if (wr_enable) begin
                            ppr_value <= pwdata[9:0];
                            pixels_per_row <= pwdata[9:0];
                        end
                    end
                default:
                    begin
                        // anything else is assumed to be a write to frame buffer memory
                        mem_wr_0 <= wr_enable;
                        mem_wr <= mem_wr_0;
                        // extract the bits forming RGB565 from the 32bit ABGR input
                        mem_data <= {pwdata[23:19],pwdata[15:10],pwdata[7:3]};
                        mem_waddr <= mem_word_addr[14:0];
                        prdata <= 32'b0;
                    end
            endcase
        end
    end
endmodule
