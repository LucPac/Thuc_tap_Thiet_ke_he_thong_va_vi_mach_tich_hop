module Mux_select_mode( 

	input wire [7:0] mode1, mode2,
	input wire sw,
	output reg [7:0] q

					);
// signal declaration
// clk_o ;

	always @(sw)
		case (sw)
			0: q = mode1;
			1: q = mode2;
		endcase
		
endmodule
