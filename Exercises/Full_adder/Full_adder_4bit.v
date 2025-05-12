`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:39:53 10/19/2024 
// Design Name: 
// Module Name:    Full_adder_4bit 
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
module Full_adder_4bit(A, B, Cin, Sum, Cout);
																	
	 input 	[3:0] 	A;			
    input 	[3:0] 	B;		
    input 				Cin;	
    output 				Cout;
    output 	[3:0] 	Sum;
	 
	 wire c0, c1, c2;
	 
	 /*Full_adder add0(A[0],B[0],Cin,Sum[0],c0);
	 Full_adder add1(A[1],B[1],c0Sum[1],c1);
	 Full_adder add2(A[2],B[2],c1,Sum[2],c2);
	 Full_adder add3(A[3],B[3],c2,Sum[3],Cout);*/
	 
	 Full_adder_1bit	add0	(.A(A[0]), .B(B[0]), .Cin(1'b0), .Sum(Sum[0]), .Cout(c0)		);
	 Full_adder_1bit	add1	(.A(A[1]), .B(B[1]), .Cin(c0), 	.Sum(Sum[1]), .Cout(c1)		);
	 Full_adder_1bit	add2	(.A(A[2]), .B(B[2]), .Cin(c1), 	.Sum(Sum[2]), .Cout(c2)		);
	 Full_adder_1bit	add3	(.A(A[3]), .B(B[3]), .Cin(c2), 	.Sum(Sum[3]), .Cout(Cout)	);

endmodule

