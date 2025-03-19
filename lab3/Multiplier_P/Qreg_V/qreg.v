// Qreg.v - Model for Q part
module Qreg(
    input        clk,
    input        reset,
    input  [7:0] data_in,
    output reg [7:0] data_out
);

  // Register behavior: on each positive clock edge or reset,
  // if reset is high, clear the register; otherwise, update with data_in.
  always @(posedge clk or posedge reset) begin
    if (reset)
      data_out <= 8'b0;    // Reset condition: clear register
    else
      data_out <= data_in; // Update with the input data
  end

endmodule
