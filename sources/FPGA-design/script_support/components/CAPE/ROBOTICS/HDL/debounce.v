//
// Refer to https://www.beyond-circuits.com/wordpress/tutorial/tutorial11/ for explanations.
//

module debounce
  (
    input clk,
    input switch_in,
    output reg switch_out
  );

  localparam bounce_limit_upper_bit = 8;
  reg [bounce_limit_upper_bit:0] bounce_count = 0;

  //---------------------------------------------------------------------------
  reg [1:0] switch_shift;
  always @(posedge clk)
    switch_shift <= {switch_shift[0],switch_in};

  //---------------------------------------------------------------------------
  always @(posedge clk)
    if (bounce_count == 0)
      begin
        switch_out <= switch_shift[0];
        if (switch_shift[1] != switch_shift[0])
          bounce_count <= (2**bounce_limit_upper_bit)-1;
      end
    else
      begin
        bounce_count <= bounce_count-1;
      end


endmodule