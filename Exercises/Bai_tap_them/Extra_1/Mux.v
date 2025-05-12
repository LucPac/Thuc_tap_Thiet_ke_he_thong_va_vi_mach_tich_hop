`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:13:37 10/22/2024 
// Design Name: 
// Module Name:    Mux 
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
module Mux_2_to_1 (A, B, EN, Y);

	input wire 	[1:0] 	A;
	input wire 	[1:0] 	B;
	input wire 				EN;
	output wire [2:0] 	Y;
	
	assign Y = (EN == 1'b0)? A:B;

endmodule
