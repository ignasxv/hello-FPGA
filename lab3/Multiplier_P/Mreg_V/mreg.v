// Mreg.v - Model for M part
module Mreg (
    input  clk,
    input  reset,
    input  [7:0] data_in,
    output reg [7:0] data_out = 8'b0 // defualt value of the output
);

  // On every positive clock edge or reset, update the output
  always @(posedge clk or posedge reset) begin
    if (reset)
      data_out <= 8'b0;
    else
      data_out <= data_in;  // Modify the behavior as required
  end

endmodule
