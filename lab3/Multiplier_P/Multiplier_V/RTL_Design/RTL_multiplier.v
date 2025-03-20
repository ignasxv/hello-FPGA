`timescale 1ns/1ps

module RTL_multiply (
    input  [3:0] multiplicand,
    input  [3:0] multiplier,
    output [7:0] product
);
    // Behavioral model: directly multiply the two 4-bit numbers.
    assign product = multiplicand * multiplier;
endmodule
