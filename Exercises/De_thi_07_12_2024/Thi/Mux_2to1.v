/*module Mux_2to1( 

	input wire clk_2hz, clk_10hz,
	input wire sw,
	output reg clk_o

					);

	always @(clk_2hz, clk_10hz, sw)
		case (sw)
			0: clk_o <= clk_2hz;
			1: clk_o <= clk_10hz;
		endcase
		
endmodule*/

module Mux_2to1
( input wire [1:0] clk,
input wire sw,
output reg clk_o
);	
// signal declaration
// clk_o ;
	always @(clk,sw)
	case (sw)
	0: clk_o <= clk[0];
	1: clk_o <= clk[1];
	endcase
endmodule