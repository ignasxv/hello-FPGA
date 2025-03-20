`timescale 1ns/1ps

module testRTL_multiply;

  // Inputs for the multiplier.
  reg  [3:0] multiplicand;
  reg  [3:0] multiplier;
  
  // Output from the multiplier.
  wire [7:0] product;
  
  // Instantiate the RTL multiplier.
  RTL_multiply uut (
    .multiplicand(multiplicand),
    .multiplier(multiplier),
    .product(product)
  );
  
  // Test sequence.
  initial begin
    // Test Vector 1: 4 * 3 = 12
    multiplicand = 4'd4;
    multiplier   = 4'd3;
    #10;
    $display("Test RTL 1: %d * %d = %d", multiplicand, multiplier, product);
    
    // Test Vector 2: 7 * 9 = 63
    multiplicand = 4'd7;
    multiplier   = 4'd9;
    #10;
    $display("Test RTL 2: %d * %d = %d", multiplicand, multiplier, product);
    
    $finish;
  end
  
endmodule
