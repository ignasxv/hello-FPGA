// testnemch for the voter

`timescale  1ns /1ps

module test;  

    reg a, b, c;  //UUT inputs
    wire v;       // UUT output

    // Instantiate the voter module
    voter uut (
        .a(a),
        .b(b),
        .c(c),
        .y(v)
    );


    always #8 a = ~a;
    always #4 b = ~b; 
    always #2 c = ~c;

    initial begin
        a = 0; 
        b = 0;
        c = 0;

        $dumpfile("voter_tb.vcd");
        $dumpvars(0, test);

        #16 $finish;
    end    

endmodule



        