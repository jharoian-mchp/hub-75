`timescale 1ns/100ps
module blinky(
input    clk,
input    resetn,
output   blink
);


reg [22:0] counter;

assign blink = counter[22];

always@(posedge clk or negedge resetn)
begin
    if(~resetn)
        begin
            counter <= 16'h0000;
        end
    else
        begin
            counter <= counter + 1;
        end
end
endmodule

