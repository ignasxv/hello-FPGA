`timescale 1ns/1ps

module RTL_multiply(
    input        clk,
    input        reset,
    input        start,
    input  [3:0] multiplicand,
    input  [3:0] multiplier,
    output reg [7:0] product,
    output reg   done
);
    // Internal registers:
    reg [7:0] P;            // Product register, holds intermediate result.
    reg [2:0] count;        // 3-bit counter (we need 4 cycles for a 4-bit multiplier)
    reg busy;               // Indicates a multiplication is in progress.
    reg [7:0] next_P;       // Temporary variable for calculating the next value of P.
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            P       <= 8'b0;
            count   <= 3'b0;
            busy    <= 1'b0;
            product <= 8'b0;
            done    <= 1'b0;
        end else if (start && !busy) begin
            // Start the multiplication: load P with {0, multiplier}.
            P       <= {4'b0, multiplier};
            count   <= 3'b0;
            busy    <= 1'b1;
            done    <= 1'b0;
        end else if (busy) begin
            // Compute next value of P:
            next_P = P;   // Copy current value
            // If the least significant bit is 1, add multiplicand to upper nibble.
            if (P[0] == 1'b1)
                next_P[7:4] = next_P[7:4] + multiplicand;
            // Logical right shift by one bit.
            next_P = {1'b0, next_P[7:1]};
            P <= next_P;
            count <= count + 1;
            // If we've completed 4 iterations, finish the multiplication.
            if (count == 3'd3) begin
                busy <= 1'b0;
                product <= next_P;
                done <= 1'b1;
            end
        end else begin
            done <= 1'b0; // Ensure done remains low when not busy.
        end
    end
endmodule
