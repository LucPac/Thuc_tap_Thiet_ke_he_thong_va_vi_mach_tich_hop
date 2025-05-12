module Demux_1_to_4(
	clk,
	out1,
	out2,
	out3,
	out4,
	mode
    );
	 
	input 	wire clk;
	input 	wire [1:0]  mode;
	output 	reg out1,out2,out3,out4;

	always @(*) 
		begin
			case (mode)
				2'b00: out1 = clk;
				2'b01: out2 = clk;
				2'b10: out3 = clk;
				2'b11: out4 = clk;
			endcase
		end

endmodule



