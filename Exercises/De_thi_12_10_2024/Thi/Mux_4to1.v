module Mux_4to1
( 
	input wire [3:0] clk,
	input wire [1:0] sw,
	output reg clk_o
);
// signal declaration
// clk_o ;
	always @(clk,sw)
	case (sw)
		0: clk_o <= clk[0];
		1: clk_o <= clk[1];
		2: clk_o <= clk[2];
		3: clk_o <= clk[3];
	endcase
endmodule
