module clock_generate (	clk_50,
						rstn,
						clk_out
						);
		parameter	 	div = 24_999_999;
		input 			clk_50;
		input			rstn;
		output			clk_out;

		reg 			clk_out;
		reg		[26:0]	counter;
		wire 			equal;

	assign equal = (counter == div)? 1'b1 : 1'b0;
	
	always @ (posedge clk_50)
		begin
			if (!rstn) counter <= 26'd0;
			else if (equal) counter <= 26'd0;
			else counter <= counter + 26'b1;
		end
		
	always @ (posedge clk_50)
		begin
			if (!rstn) clk_out <= 1'd0;
			else if (equal) clk_out <= ~ clk_out;
		end
endmodule 