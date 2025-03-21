`timescale 1ns/1ps

module test_RTL_multiply;
    // Inputs
    reg clk, reset, start;
    reg [3:0] multiplicand, multiplier;
    // Outputs
    wire [7:0] product;
    wire done;
    
    // Instantiate the RTL multiplier
    RTL_multiply uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product),
        .done(done)
    );
    
    // Clock generation: 10 ns period (toggle every 5 ns)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        // Apply reset
        reset = 1; start = 0;
        multiplicand = 4'b0000;
        multiplier = 4'b0000;
        #10;
        
        reset = 0;
        #10;
        
        // Test Vector 1: 4 * 3 = 12
        multiplicand = 4'd4;
        multiplier = 4'd3;
        start = 1;  // Begin multiplication
        #10;
        start = 0;  // Deassert start
        
        // Wait until multiplication is done
        wait(done == 1);
        #10;
        $display("Test 1: %d * %d = %d", multiplicand, multiplier, product);
        #20;
        
        // Test Vector 2: 7 * 9 = 63
        reset = 1;  // Reset before next operation
        #10;
        reset = 0;
        #10;
        multiplicand = 4'd7;
        multiplier = 4'd9;
        start = 1;
        #10;
        start = 0;
        
        // Wait until multiplication is done
        wait(done == 1);
        #10;
        $display("Test 2: %d * %d = %d", multiplicand, multiplier, product);
        #20;
        
        $finish;
    end
    
    // Optional: Monitor key signals during simulation.
    initial begin
        $display(" reset | start | multiplicand | multiplier | product | done");
        $monitor("   %b   |   %b   |      %d       |     %d     |   %d   |  %b",
                  reset, start, multiplicand, multiplier, product, done);
    end
endmodule
