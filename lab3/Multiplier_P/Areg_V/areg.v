module Areg (
    Q3, Q2, Q1, Q0,   // 4-bit output
    D3, D2, D1, D0,   // 4-bit input data
    clk, reset,     // Clk and asynchronous reset input
    C1, C0          // 2-bit control signals
);

  input D3, D2, D1, D0, clk, reset, C1, C0;
  output reg Q3, Q2, Q1, Q0; 

  // Define the operation codes:
  // LOAD  : 00, RESET : 01, SHIFT : 10, HOLD : 11
  parameter LOAD  = 2'b00;
  parameter RST   = 2'b01;
  parameter SHIFT = 2'b10;
  parameter HOLD  = 2'b11;
  
  // On every rising clk edge or asynchronous reset,
  // update the register based on the control signals.
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Asynchronous reset: clear the register.
      {Q3, Q2, Q1, Q0} <= 4'b0000;
    end else begin
      case ({C1, C0})
        // Even though reset is already handled by the reset input,
        // you can also include a RESET command if desired.
        RST:   {Q3, Q2, Q1, Q0} <= 4'b0000;
        LOAD:  {Q3, Q2, Q1, Q0} <= {D3, D2, D1, D0}; // Load input data.
        SHIFT: // Perform an arithmetic right shift:
               // The MSB is maintained (sign extension) and the register shifts right by one.
               {Q3, Q2, Q1, Q0} <= {Q3, Q3, Q2, Q1};
        HOLD:  {Q3, Q2, Q1, Q0} <= {Q3, Q2, Q1, Q0}; // Hold current value.
        default: {Q3, Q2, Q1, Q0} <= {Q3, Q2, Q1, Q0};
      endcase
    end
  end

endmodule
