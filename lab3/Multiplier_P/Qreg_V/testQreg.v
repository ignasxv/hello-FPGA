// testQreg.v - Test bench for Qreg.v
`timescale 1ns/1ps

module testQreg;

  // Signal declarations
  reg        clk;
  reg        reset;
  reg  [7:0] data_in;
  wire [7:0] data_out;
  
  // Instantiate the Qreg module
  Qreg uut (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .data_out(data_out)
  );
  
  // Generate a clock signal with a 10 ns period
  initial clk = 0;
  always #5 clk = ~clk;
  
  // Test sequence
  initial begin
    // Start by asserting reset to initialize the register
    reset = 1;
    data_in = 8'b0;
    #10; // Wait 10 ns
    
    // Release reset to start normal operation
    reset = 0;
    
    // Apply a series of test vectors
    data_in = 8'h55;  // Test vector 1: binary 01010101
    #10;
    
    data_in = 8'hAA;  // Test vector 2: binary 10101010
    #10;
    
    data_in = 8'hFF;  // Test vector 3: binary 11111111
    #10;
    
    // End the simulation
    $finish;
  end

endmodule
