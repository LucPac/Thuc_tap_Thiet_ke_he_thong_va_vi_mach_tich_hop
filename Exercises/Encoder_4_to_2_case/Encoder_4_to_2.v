`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:39 10/25/2024 
// Design Name: 
// Module Name:    Encoder_4_to_2 
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
module Encoder_4_to_2(IN, OUT);

	input [3:0] IN ;
	output reg [1:0] OUT;
	
	always @(IN)
		begin
			case (IN)
				4'b0000: OUT = 2'b00;
				4'b0010: OUT = 2'b01;
				4'b0100: OUT = 2'b10;
				4'b1000: OUT = 2'b11;
			endcase
		end
			
endmodule
