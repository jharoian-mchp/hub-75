`timescale 1ns/100ps
module apb_ctrl_status(
   input               pclk,
   input               presetn,
   input               penable,
   input               psel,
   input       [7:0]   paddr,
   input               pwrite,
   input       [31:0]  pwdata,
   output  reg [31:0]  prdata,
   output  reg [31:0]  control,
   input       [31:0]  status
   );

   
   localparam [7:0] STATUS      = 8'h20; // READ-ONLY REGISTER
   localparam [7:0] CONTROL_1   = 8'h10; // READ/WRITE Register
   localparam [7:0] CONTROL_0   = 8'h00; // READ_ONLY DEADBEEF REGISTER

   reg [31:0] control_value;
   
   wire rd_enable;
   wire wr_enable;  

   assign wr_enable = (penable && pwrite && psel);
   assign rd_enable = (!pwrite && psel);

   always@(posedge pclk or negedge presetn)
   begin
      if(~presetn)
         begin
            prdata <= 'b0;
            control_value <= 32'h00000000;
            control <= 32'h00000000;
         end
      else
         begin
            case(paddr[7:0])
               STATUS:
                  begin
                    if (rd_enable)
                        begin
                           prdata <= status;
                        end
                  end
               CONTROL_0:
                  begin
                    if (rd_enable)
                        begin
                           prdata <= 32'hdeadbeef;
                           control <= 32'hdeadbeef;
                        end
                  end
                CONTROL_1:
                    begin
                      if (rd_enable)
                        begin
                            prdata <= control_value;
                            control <= control_value;
                        end
                      else if (wr_enable)
                        begin
                            control_value <= pwdata;
                        end
                    end  
               default:
                  begin
                     prdata <= 32'b0;
                  end
            endcase
         end
   end
endmodule