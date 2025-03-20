`timescale 1ns/1ps

module testMultiplier;

  // Declare inputs for the multiplier module
  reg  [3:0] Multiplicand;
  reg  [3:0] Multiplier;
  reg        Start, Reset, Clock;
  
  // Declare outputs from the multiplier module
  wire [7:0] Product;
  wire       Done;
  
  // Instantiate the top-level multiplier module
  multiplier uut (
    .Multiplicand(Multiplicand),
    .Multiplier(Multiplier),
    .Start(Start),
    .Reset(Reset),
    .Clock(Clock),
    .Done(Done),
    .Product(Product)
  );
  
  // Clock generation: 10 ns period (toggle every 5 ns)
  initial begin
    Clock = 0;
    forever #5 Clock = ~Clock;
  end
  
  // Test sequence
  initial begin
    // Initialize signals and assert an initial reset
    Reset = 1; 
    Start = 0;
    Multiplicand = 4'b0000;
    Multiplier   = 4'b0000;
    #10;
    
    Reset = 0;
    #10;
    
    // Test Vector 1: For example, 4 * 3 = 12
    Multiplicand = 4'd4;
    Multiplier   = 4'd3;
    Start = 1;  // Begin multiplication
    #10;
    Start = 0;  // Deassert start
    
    // Wait until the Done signal is asserted by the FSM
    wait(Done == 1);
    #20;  // Allow signals to settle
    $display("Test 1: Multiplicand = %d, Multiplier = %d, Product = %d", 
             Multiplicand, Multiplier, Product);
    #20;
    
    // Test Vector 2: For example, 7 * 9 = 63
    Reset = 1;   // Reset before starting new multiplication
    #10;
    Reset = 0;
    Multiplicand = 4'd7;
    Multiplier   = 4'd9;
    Start = 1;
    #10;
    Start = 0;
    
    // Wait until multiplication is done
    wait(Done == 1);
    #20;
    $display("Test 2: Multiplicand = %d, Multiplier = %d, Product = %d", 
             Multiplicand, Multiplier, Product);
    #20;
    
    $finish;
  end
  
  // Monitor key signals during simulation (optional)
  initial begin
    $monitor("Time: %0t | Reset: %b | Start: %b | Multiplicand: %d | Multiplier: %d | Product: %d | Done: %b", 
             $time, Reset, Start, Multiplicand, Multiplier, Product, Done);
  end

endmodule
