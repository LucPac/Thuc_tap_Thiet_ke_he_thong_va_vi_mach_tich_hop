module Demux_1to2(

	input clk, sw,
	output reg q1, q2
    );

	always @(sw)
		begin
			case(sw)
				0: q1 <= clk;
				1: q2 <= clk;
				default q1 <= clk;
			endcase
		end
		
endmodule
