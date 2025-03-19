`timescale 1ns/1ps

module testcontrol;

  // Outputs from FSM
  wire LM, LA0, LA1, LQ0, LQ1, AS, done;
  // Inputs to FSM
  reg clock, Qm1, Q0, start, reset;
  
  // Instantiate the FSM controller
  FSM uut (
    .LM(LM), .LA0(LA0), .LA1(LA1),
    .LQ0(LQ0), .LQ1(LQ1),
    .AS(AS), .done(done),
    .clock(clock), .Qm1(Qm1), .Q0(Q0),
    .start(start), .reset(reset)
  );
  
  // Clock generation: period = 10 ns (toggle every 5 ns)
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end
  
  // Test sequence
  initial begin
    // Apply reset at start
    reset = 1; start = 0;
    Qm1 = 0; Q0 = 0;
    #10;
    reset = 0;
    #10;
    
    // Begin multiplication: assert start for one cycle
    start = 1;
    #10;
    start = 0;
    
    // Stimulate Booth decision cases:
    // Case 1: {Q0, Qm1} = 01 => should choose addition in s1.
    Q0 = 1; Qm1 = 0;
    #10;
    
    // Case 2: {Q0, Qm1} = 10 => should choose subtraction in s1.
    Q0 = 0; Qm1 = 1;
    #10;
    
    // Case 3: {Q0, Qm1} = 00 => no add/sub; goes to s4.
    Q0 = 0; Qm1 = 0;
    #10;
    
    // Case 4: {Q0, Qm1} = 11 => no add/sub; goes to s4.
    Q0 = 1; Qm1 = 1;
    #10;
    
    // Let the FSM run for several cycles to see counter behavior and done signal.
    #50;
    
    $finish;
  end
  
  // Monitor signals (excluding simulation time)
  initial begin
    $display("clk | reset | start | Qm1 Q0 | LM | LA1 LA0 | LQ1 LQ0 | AS | done");
    $monitor("%b   |   %b   |   %b   |  %b %b | %b |   %b %b   |  %b %b |  %b | %b",
             clock, reset, start, Qm1, Q0, LM, LA1, LA0, LQ1, LQ0, AS, done);
  end

endmodule
