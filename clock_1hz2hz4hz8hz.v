`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:54 10/24/2024 
// Design Name: 
// Module Name:    clock_1hz2hz4hz8hz 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_1hz2hz4hz8hz(
    input clk,
    input rst,
    output [3:0] clkout
    );

		clock_generate  gen1hz  (clk,rst,clkout[0]);

		clock_generate  gen2hz  (clk,rst,clkout[1]);
				defparam gen2hz.div = 12500000;

		clock_generate  gen3hz  (clk,rst,clkout[2]);
				defparam gen3hz.div = 6250000;

		clock_generate  gen4hz  (clk,rst,clkout[3]);
				defparam gen4hz.div = 3125000;
				
//		clock_generate  gen5hz  (clk,rst,clkout[4]);
//				defparam gen5hz.div = 1562500;	
endmodule


////////////////////////////////////////////////////
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
///////////////////////////////////////////////////////