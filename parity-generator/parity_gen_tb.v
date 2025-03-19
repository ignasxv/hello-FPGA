// parity adjustemnet test bench

`timescale 1ns/1ps

module test; 
    reg p;
    reg [6:0] tt_in;
    wire [7:0] pdata;

    par_gen UUT (
        .p(p),
        .tt_in(tt_in),
        .pdata(pdata)
    );

    // test data
    always #2 tt_in = tt_in + 1;
    always #3 p = ~p;

    initial begin
        p = 0;
        tt_in = 0;

        $dumpfile("parity_gen_tb.vcd");
        $dumpvars(0, test);
        $display("\np, tt_in, pdata");
        
        $monitor("%b %b %b", p, tt_in, pdata);
        #20 $finish;
    end 
    
endmodule