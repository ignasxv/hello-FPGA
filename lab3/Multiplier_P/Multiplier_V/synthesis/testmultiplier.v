`timescale 1ns/1ps

module testMultiplier;

  // Inputs for the multiplier module
  reg  [3:0] Multiplicand;
  reg  [3:0] Multiplier;
  reg        Start, Reset, Clock;
  
  // Outputs from the multiplier module
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
  
  // Clock generation: 10 ns period
  initial begin
    Clock = 0;
    forever #5 Clock = ~Clock;
  end
  
  // Test sequence
  initial begin
    // Initialize signals and apply an initial reset
    Reset = 1; Start = 0;
    Multiplicand = 4'b0000;
    Multiplier   = 4'b0000;
    #10;
    
    Reset = 0;
    #10;
    
    // Test Vector 1: 4 * 3 = 12
    Multiplicand = 4'd4;
    Multiplier   = 4'd3;
    Start = 1;  // Begin multiplication
    #10;
    Start = 0;  // Deassert start
    
    // Wait until multiplication is done
    wait(Done == 1);
    #20;  // Allow signals to settle
    
    $display("Test 1: Multiplicand = %d, Multiplier = %d, Product = %d", 
              Multiplicand, Multiplier, Product);
    #20;
    
    // Test Vector 2: 7 * 9 = 63
    Reset = 1;   // Reset before next operation
    #10;
    Reset = 0;
    Multiplicand = 4'd5;
    Multiplier   = 4'd7;
    Start = 1;
    #10;
    Start = 0;
    
    // Wait until done signal is asserted
    wait(Done == 1);
    #20;
    
    $display("Test 3: Multiplicand = %d, Multiplier = %d, Product = %d", 
              Multiplicand, Multiplier, Product);
    #20;
    
    $finish;
  end
  
  // Monitor key signals (excluding simulation time)
  initial begin
    $display("Clock | Reset | Start | Multiplicand | Multiplier | Product | Done");
    $monitor("  %b   |   %b   |   %b   |      %d      |     %d     |   %d   |   %b", 
             Clock, Reset, Start, Multiplicand, Multiplier, Product, Done);
  end

endmodule
