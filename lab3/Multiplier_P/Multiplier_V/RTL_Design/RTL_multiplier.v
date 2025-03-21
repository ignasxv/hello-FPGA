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
    reg [1:0] count;        // 3-bit counter (we need 4 cycles for a 4-bit multiplier)
    
    assign busy = (count==0?0:1);

    always @(posedge clk ) 
    begin
        if (start) begin
            product = {4'b0, multiplier};
            count   = 2'd3;
	    P_1 = 0;
        end else 
	    if (busy!=1) begin
            	case( {product[0],P_1} )
		    2'b00, 2'b11: ;
		    2'b01: product[7:4] = product[7:4] + multiplicand;
		    2'b10: product[7:4] = product[7:4] - multiplicand;
            	endcase
		{product,P_1} =  {product[n],product}>>1;
            	count <= count - 1;
            end
    end
endmodule
