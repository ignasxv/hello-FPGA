// testMreg.v - Test bench for Mreg.v
`timescale 1ns/1ps

module testMreg;

  // Declare test bench signals
  reg clk;
  reg reset;
  reg [7:0] data_in;
  wire [7:0] data_out;
  
  // Instantiate the Mreg module
  Mreg uut (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .data_out(data_out)
  );


  always #2 clk = ~clk; // 10ns period clock
  always #4 data_in = data_in + 1;
  always #3 reset = ~reset;
  
  // Test sequence
  initial begin
    // Initialize inputs and apply reset

    clk = 0;  
    reset = 0;
    data_in = 8'd0;

    $dumpfile("testMreg.vcd");
    $dumpvars(0, testMreg);
    $display(" table.header[*clk*][*reset*][Data_in][Data_out],");
    $monitor("[*%b*],[*%b*],[%b],[%b],", clk, reset, data_in, data_out);
    // End simulation
    #50  $finish;
  end
endmodule
