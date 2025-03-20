`timescale 1ns/1ps

module testMultiplier;

  // Inputs to the multiplier module
  reg  [3:0] Multiplicand;
  reg  [3:0] Multiplier;
  reg        Start, Reset, Clock;
  
  // Outputs from the multiplier module
  wire [7:0] Product;
  wire       Done;
  
  // Instantiate the top-level multiplier module (from multiplier.v)
  multiplier uut (
    .Multiplicand(Multiplicand),
    .Multiplier(Multiplier),
    .Start(Start),
    .Reset(Reset),
    .Clock(Clock),
    .Product(Product),
    .Done(Done)
  );
  
  // Clock generation: create a clock with a 10 ns period (toggle every 5 ns)
  initial begin
    Clock = 0;
    forever #5 Clock = ~Clock;
  end
  
  // Test sequence
  initial begin
    // Apply initial reset and initialize inputs
    Reset = 1; Start = 0;
    Multiplicand = 4'b0000;
    Multiplier   = 4'b0000;
    #10;
    
    Reset = 0;
    #10;
    
    // Test Vector 1: Multiply 4 by 3 (expected product 12)
    Multiplicand = 4'd4;
    Multiplier   = 4'd3;
    Start = 1;  // Begin multiplication operation
    #10;
    Start = 0;  // Deassert start
    
    // Wait until the multiplication is finished
    wait(Done == 1);
    #20;  // Allow signals to settle
    $display("Test 1: Multiplicand = %d, Multiplier = %d, Product = %d", 
             Multiplicand, Multiplier, Product);
    #20;
    
    // Test Vector 2: Multiply 7 by 9 (expected product 63)
    Reset = 1;  // Reset before next operation
    #10;
    Reset = 0;
    Multiplicand = 4'd7;
    Multiplier   = 4'd9;
    Start = 1;
    #10;
    Start = 0;
    
    // Wait until multiplication is finished
    wait(Done == 1);
    #20;
    $display("Test 2: Multiplicand = %d, Multiplier = %d, Product = %d", 
             Multiplicand, Multiplier, Product);
    #20;
    
    $finish;
  end
  
  // Optional: Monitor key signals to observe behavior during simulation
  initial begin
    $display("Clock Reset Start | Multiplicand | Multiplier | Product | Done");
    $monitor("%b     %b     %b    |    %d     |    %d     |   %d   | %b", 
             Clock, Reset, Start, Multiplicand, Multiplier, Product, Done);
  end

endmodule
