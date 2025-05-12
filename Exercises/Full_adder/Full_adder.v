`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:41:22 10/19/2024 
// Design Name: 
// Module Name:    Full_adder 
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
module Full_adder_1bit(A, B, Cin, Sum, Cout);

	input 	A; // Ngo vao
	input 	B; // Ngo vao
	input  	Cin;
	output  	Sum; // Tong
	output  	Cout;
	
		wire d1, d2, d3;
	
	assign d1 	= 	A	^	B;
	assign d3 	= 	A	&	B;
	assign Sum 	= 	d1	^	Cin;
	assign d2 	= 	d1	&	Cin;
	assign Cout = 	d2 | 	d3;


endmodule
