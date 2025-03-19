`timescale 1ns/1ps

module testaddsub;

  // Declare inputs as reg (individual bits)
  reg a3, a2, a1, a0;
  reg b3, b2, b1, b0;
  reg control;  // 0 for addition, 1 for subtraction

  // Outputs (from the adder/subtractor) as wires
  wire co, r3, r2, r1, r0;

  // Instantiate the addsub module
  addsub uut (
    .co(co),
    .r3(r3), .r2(r2), .r1(r1), .r0(r0),
    .a3(a3), .a2(a2), .a1(a1), .a0(a0),
    .b3(b3), .b2(b2), .b1(b1), .b0(b0),
    .control(control)
  );

  // Display header (each signal printed as a binary digit)
  initial begin
    $display(" a3a2a1a0  b3b2b1b0  control  |  co r3r2r1r0 ");
    $display("-----------------------------------------");
  end

  // Monitor the signals (each concatenated for clarity)
  initial begin
    $monitor("   %b%b%b%b     %b%b%b%b      %b     |   %b %b%b%b%b",
             a3, a2, a1, a0,
             b3, b2, b1, b0,
             control,
             co, r3, r2, r1, r0);
  end

  // Apply test cases
  initial begin
    // Test 1: Addition: 4 + 3
    // a = 4 (0100), b = 3 (0011), expected sum = 7 (0111) and co = 0.
    a3 = 0; a2 = 1; a1 = 0; a0 = 0;  // 0100
    b3 = 0; b2 = 0; b1 = 1; b0 = 1;  // 0011
    control = 0;                   // Addition mode
    #10;
    
    // Test 2: Addition with carry: 9 + 8
    // a = 9 (1001), b = 8 (1000), expected sum = 17 (10001),
    // so r3r2r1r0 = 0001 and co = 1.
    a3 = 1; a2 = 0; a1 = 0; a0 = 1;  // 1001
    b3 = 1; b2 = 0; b1 = 0; b0 = 0;  // 1000
    control = 0;                   // Addition mode
    #10;

    // Test 3: Subtraction: 7 - 4
    // a = 7 (0111), b = 4 (0100), expected difference = 3 (0011).
    a3 = 0; a2 = 1; a1 = 1; a0 = 1;  // 0111
    b3 = 0; b2 = 1; b1 = 0; b0 = 0;  // 0100
    control = 1;                   // Subtraction mode
    #10;

    // Test 4: Subtraction with negative result: 3 - 5
    // a = 3 (0011), b = 5 (0101), expected difference in 5-bit two's complement is -2.
    // In 5-bit, -2 is represented as 11110.
    a3 = 0; a2 = 0; a1 = 1; a0 = 1;  // 0011
    b3 = 0; b2 = 1; b1 = 0; b0 = 1;  // 0101
    control = 1;                   // Subtraction mode
    #10;

    // Test 5: Addition: 6 + 10
    // a = 6 (0110), b = 10 (1010), expected sum = 16 (10000),
    // so r3r2r1r0 = 0000 and co = 1.
    a3 = 0; a2 = 1; a1 = 1; a0 = 0;  // 0110
    b3 = 1; b2 = 0; b1 = 1; b0 = 0;  // 1010
    control = 0;                   // Addition mode
    #10;

    $finish;
  end

endmodule
