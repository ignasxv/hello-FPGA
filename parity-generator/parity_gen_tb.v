// parity adjustemnet test bench

`timescale 1ns/1ps

module test; 
    reg [6:0] tt_in;
    wire [7:0] pdata;

    par_gen UUT (
        .tt_in(tt_in),
        .pdata(pdata)
    );

    always #2 tt_in = tt_in + 1;
        
    initial begin
        tt_in = 0;

        $dumpfile("parity_gen_tb.vcd");
        $dumpvars(0, test);
        $display("\ntt_in, pdata");
        
        $monitor("%b %b", tt_in, pdata);
        #20 $finish;
    end 

    
endmodule