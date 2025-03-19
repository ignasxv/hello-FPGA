// adjust data parity

// Author; Ignas XV

module par_gen (
    input wire [6:0] tt_in, 
    output wire [7:0] pdata
);

    wire par; 
    assign par = ^tt_in; // XOR 
    
endmodule