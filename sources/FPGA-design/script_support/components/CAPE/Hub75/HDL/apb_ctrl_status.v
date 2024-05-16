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
    output reg [8:0]    pixels_per_row,
   
    output reg          mem_wr,
    output reg [31:0]   mem_data,
    output reg [14:0]   mem_waddr
);

    localparam [15:0] STATUS            = 16'h8000;         // Read register
    localparam [15:0] CONTROL_0         = 16'h8010;         // Read/write control register
    localparam [15:0] PPROW_0           = 16'h8020;         // Pixels per row
    localparam DEFAULT_CONTROL          = 32'h0000_0001;    // enable gen timing
    localparam DEFAULT_PIXELS_PER_ROW   = 9'd64;            // 64 pixels per row default (one screen)

    reg [31:0] control_value;
    reg [8:0] ppr_value;
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
            ppr_value <= DEFAULT_PIXELS_PER_ROW;
            control <= DEFAULT_CONTROL;
            pixels_per_row <= DEFAULT_PIXELS_PER_ROW;
        end else begin
            case (paddr[15:0])
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
                            ppr_value <= pwdata[8:0];
                            pixels_per_row <= pwdata[8:0];
                        end
                    end
                default:
                    begin
                        // anything else is assumed to be a write to frame buffer memory
                        mem_wr_0 <= wr_enable;
                        mem_wr <= mem_wr_0;
                        mem_data <= pwdata;
                        mem_waddr <= paddr[14:0];
                        prdata <= 32'b0;
                    end
            endcase
        end
    end
endmodule