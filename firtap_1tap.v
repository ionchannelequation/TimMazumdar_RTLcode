module fir_1tap (input iclk , input irst,
        input [7:0] i_tap ,
        output [7:0] o_tap_2D,
        input [39:0] i_result_partial ,
        output [39:0] o_result_reg_out,
               input [7:0] h_in, output [7:0] h_out,
        input coeff_load
       );
  reg [7:0] i_tap_D, i_tap_2D;
 
  always @( posedge iclk)
    begin
      if (irst) begin
        i_tap_D <= 0;
        i_tap_2D <= 0; end
      else begin
        i_tap_D <= i_tap;
        i_tap_2D <= i_tap_D; end
    end
  assign o_tap_2D = i_tap_2D;
  reg [7:0] h_reg;
  reg signed  [ 15:0] mout_reg;
  always @(posedge iclk) begin
    if(~irst) h_reg <= h_in ;
    else h_reg <= 0;
  end
 
  assign h_out = h_reg;
  // Multiplier
  wire [ 39:0] mout_out;  
  always @(posedge iclk) begin
    mout_reg <= h_reg*i_tap_2D;
  end
  reg [39:0] result_reg_out;
  always @(posedge iclk)
    begin
      result_reg_out   <= mout_reg + i_result_partial; // Input to FIt stage + Multiplier result
     
    end
assign o_result_reg_out =   result_reg_out;
endmodule
