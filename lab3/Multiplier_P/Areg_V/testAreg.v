`timescale 1ns/1ps

module testAreg;

  // Input signals for Areg
  reg D3, D2, D1, D0;
  reg clk, reset;
  reg C1, C0;  // 2-bit control signals

  // Output signals from Areg
  wire Q3, Q2, Q1, Q0;
  
  // Instantiate the Areg module
  Areg uut (
    .Q3(Q3), .Q2(Q2), .Q1(Q1), .Q0(Q0),
    .D3(D3), .D2(D2), .D1(D1), .D0(D0),
    .clk(clk), .reset(reset),
    .C1(C1), .C0(C0)
  );
  
  // Clock generation: 10 ns period (toggle every 5 ns)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  // Test stimulus
  initial begin
    // --- Initialization and asynchronous reset ---
    reset = 1;
    D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    C1 = 0; C0 = 0;  // Control doesn't matter while reset is active
    #10;
    
    // Release asynchronous reset
    reset = 0;
    
    // --- Test LOAD Operation (control = 00) ---
    // Expected: Register A loads the new 4-bit value.
    D3 = 1; D2 = 0; D1 = 1; D0 = 1;  // Data = 1011
    C1 = 0; C0 = 0;                // LOAD command
    #10;
    
    // --- Test SHIFT Operation (control = 10) ---
    // Expected: Perform arithmetic right shift.
    // New value = {Q3, Q3, Q2, Q1} based on the current register value.
    C1 = 1; C0 = 0;  // SHIFT command
    #10;
    
    // --- Test HOLD Operation (control = 11) ---
    // Change data inputs (should have no effect since register holds its value).
    D3 = 0; D2 = 1; D1 = 0; D0 = 1;  // New data (ignored)
    C1 = 1; C0 = 1;                // HOLD command
    #10;
    
    // --- Test RESET Command (control = 01) ---
    // This command should clear the register.
    C1 = 0; C0 = 1;  // RESET command (register should be cleared)
    #10;
    
    // --- Test Asynchronous Reset again ---
    reset = 1;
    #10;
    reset = 0;
    #10;
    
    $finish;
  end
  
  // Monitor changes and display results (excluding simulation time)
  initial begin
    $display("clk | reset | C1 C0 | D3 D2 D1 D0 | Q3 Q2 Q1 Q0");
    $monitor("%b |  %b   | %b %b |  %b %b %b %b | %b %b %b %b",
             clk, reset, C1, C0, D3, D2, D1, D0, Q3, Q2, Q1, Q0);
  end

endmodule
