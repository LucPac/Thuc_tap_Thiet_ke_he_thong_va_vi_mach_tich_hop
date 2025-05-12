module Mux_3to1(

	input mode0, mode1, mode2,
	input [1:0] sw,
	output reg [11:0] q
	
    );

	always @(mode0, mode1, mode2, sw)
		begin 
			case(sw)
				0: q <= mode0;
				1: q <= mode1;
				2: q <= mode2;
				default q <= mode0;
			endcase
		end
			
endmodule
