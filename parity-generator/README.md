# Parity generator
![alt text](image-1.png)

This task involves designing an interface module that converts a 7-bit ASCII input from a teletype into an 8-bit output for a computer. The 7-bit input, provided on the signal `tt_in`, is directly copied into the lower 7 bits of the output (`pdata`), while the most significant bit (MSB) is used as a parity bit. A control signal `p` selects the parity type:  
- **p = 0:** Even parity (the total number of 1s in the 8-bit word should be even)  
- **p = 1:** Odd parity (the total number of 1s should be odd)

For example, consider the 7-bit data `0101010` which has 3 ones:  
- **Even Parity:** Since 3 is odd, the parity bit is set to 1 to make the total 4 (even), resulting in `1 0101010`.  
- **Odd Parity:** Since the total is already odd, the parity bit is set to 0, resulting in `0 0101010`.

This extra parity bit serves as a simple error-checking mechanism by ensuring the expected even or odd count of 1s.

# Even Parity checker
Parity gen can be simply built as an XOR of all the bits in `tt_in`

| Input bits (tt_in) | p | Number of 1s | Parity bit | Output (pdata) |
|-------------------|---|--------------|------------|----------------|
| 0101010          | 0 | 3 (odd)     | 1          | 1 0101010     |
| 0101010          | 1 | 3 (odd)     | 0          | 0 0101010     |
| 1111111          | 0 | 7 (odd)     | 1          | 1 1111111     |
| 1111111          | 1 | 7 (odd)     | 0          | 0 1111111     |
| 1010101          | 0 | 4 (even)    | 0          | 0 1010101     |
| 1010101          | 1 | 4 (even)    | 1          | 1 1010101     |

## mult-bit xoring
In this line of Verilog code, the reduction XOR operator (^) is used to compute a single-bit parity value from the multi-bit vector `tt_in`. Here's what happens:

- **Reduction XOR (^) Operator:** The caret symbol (^) when used as a unary operator in front of a vector (like `tt_in`) performs a bitwise XOR across all bits of the vector.
- **Parity Calculation:** The expression `^tt_in` calculates the XOR of all bits in `tt_in`. This means that if there is an odd number of 1s in `tt_in`, the result is 1; if there is an even number of 1s, the result is 0.
- **Assignment:** The computed parity value is then assigned to the signal `par`.

