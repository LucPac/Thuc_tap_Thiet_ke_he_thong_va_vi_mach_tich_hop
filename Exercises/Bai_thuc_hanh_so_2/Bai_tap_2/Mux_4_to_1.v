module Mux_4_to_1
( input wire [3:0] clk,
input wire [1:0] sw,
output reg clk_o
);
// signal declaration
	always @(clk,sw)
	case (sw)
	0: clk_o <= clk[0];
	1: clk_o <= clk[1];
	2: clk_o <= clk[2];
	3: clk_o <= clk[3];
	endcase
endmodule

