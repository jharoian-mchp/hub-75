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
    output reg [11:0]   BCM_count[0:5],
   
    output reg          mem_wr,
    output reg [15:0]   mem_data,
    output reg [14:0]   mem_waddr
);

    // addresses of the control/status registers (in 32bit multiples)
    localparam [15:0] STATUS            = 16'h8000;         // Read register
    localparam [15:0] CONTROL_0         = 16'h8001;         // Read/write control register
    localparam [15:0] PPROW_0           = 16'h8002;         // Pixels per row
    localparam [15:0] BCM_7             = 16'h8003;         // BCM bit plane timing registers
    localparam [15:0] BCM_6             = 16'h8004;         
    localparam [15:0] BCM_5             = 16'h8005;         
    localparam [15:0] BCM_4             = 16'h8006;         
    localparam [15:0] BCM_3             = 16'h8007;         
    localparam [15:0] BCM_2             = 16'h8008;      

    localparam DEFAULT_CONTROL          = 32'h0000_0001;    // enable gen timing
    localparam DEFAULT_PIXELS_PER_ROW   = 10'h40;           // 64 pixels per row default (one screen)

    reg [11:0] BCM_count_value[0:5];                        // Binary Coded Modulation ON time registers
    reg [31:0] control_value;
    reg [9:0] ppr_value;
    
    reg mem_wr_0;
    wire rd_enable;
    wire wr_enable;

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

            // generate the initial values for the Binary Coded Modulation delays
            // these are based upon the number of pixels currently being displayed
            // but can be adjusted to effect the brightness of certain bit planes
            for(integer ctrl_reg_idx = 0; ctrl_reg_idx < 6; ctrl_reg_idx = ctrl_reg_idx + 1) begin
                BCM_count_value[ctrl_reg_idx] <= ((6'b000001 << ctrl_reg_idx) * (DEFAULT_PIXELS_PER_ROW + 6));
                BCM_count[ctrl_reg_idx] <= ((6'b000001 << ctrl_reg_idx) * (DEFAULT_PIXELS_PER_ROW + 6));
            end 
            
        end else begin
            case (paddr[17:2])
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
                BCM_7:
                    begin
                        if (rd_enable) begin
                            prdata <= BCM_count_value[5];
                        end else if (wr_enable) begin
                            BCM_count_value[5] <= pwdata[11:0];
                            BCM_count[5] <= pwdata[11:0];
                        end
                    end
                BCM_6:
                    begin
                        if (rd_enable) begin
                            prdata <= BCM_count_value[4];
                        end else if (wr_enable) begin
                            BCM_count_value[4] <= pwdata[11:0];
                            BCM_count[4] <= pwdata[11:0];
                        end
                    end
                BCM_5:
                    begin
                        if (rd_enable) begin
                            prdata <= BCM_count_value[3];
                        end else if (wr_enable) begin
                            BCM_count_value[3] <= pwdata[11:0];
                            BCM_count[3] <= pwdata[11:0];
                        end
                    end
                BCM_4:
                    begin
                        if (rd_enable) begin
                            prdata <= BCM_count_value[2];
                        end else if (wr_enable) begin
                            BCM_count_value[2] <= pwdata[11:0];
                            BCM_count[2] <= pwdata[11:0];
                        end
                    end
                BCM_3:
                    begin
                        if (rd_enable) begin
                            prdata <= BCM_count_value[1];
                        end else if (wr_enable) begin
                            BCM_count_value[1] <= pwdata[11:0];
                            BCM_count[1] <= pwdata[11:0];
                        end
                    end
                BCM_2:
                    begin
                        if (rd_enable) begin
                            prdata <= BCM_count_value[0];
                        end else if (wr_enable) begin
                            BCM_count_value[0] <= pwdata[11:0];
                            BCM_count[0] <= pwdata[11:0];
                        end
                    end
                default:
                    begin
                        // anything else is assumed to be a write to frame buffer memory
                        mem_wr <= wr_enable;
                        // extract the bits forming RGB565 from the 32bit ABGR input
                        mem_data <= {pwdata[23:19],pwdata[15:10],pwdata[7:3]};
                        mem_waddr <= paddr[16:2];
                        prdata <= 32'b0;
                    end
            endcase
        end
    end
endmodule
