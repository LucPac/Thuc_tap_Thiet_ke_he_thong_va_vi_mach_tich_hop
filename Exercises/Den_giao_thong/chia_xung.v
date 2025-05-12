module chia_xung(
clk_in,
rst,
clk_out
    );
		parameter	 	div = 24_999_999;
		input 			clk_in;
		input			   rst;
		output			clk_out;

		reg 			clk_out;
		reg		[26:0]	counter;
		wire 			equal;

	assign equal = (counter == div)? 1'b1 : 1'b0;
	
	always @ (posedge clk_in)
		begin
		if (!rst) counter <= 26'd0;
			else if (equal) counter <= 26'd0;
				else counter <= counter + 26'b1;
		end
	always @ (posedge clk_in)
		begin
		if (!rst) clk_out <= 1'd0;
			else if (equal) clk_out <= ~ clk_out;
		end

endmodule