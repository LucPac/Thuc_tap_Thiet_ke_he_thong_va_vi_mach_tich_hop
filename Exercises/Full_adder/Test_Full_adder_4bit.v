`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:05:33 10/20/2024
// Design Name:   Full_adder_4bit
// Module Name:   D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Full_adder/Test_Full_adder_4bit.v
// Project Name:  Full_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Full_adder_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Full_adder_4bit;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg Cin;

	// Outputs
	wire [3:0] Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	Full_adder_4bit uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A = 3;
		B = 4;
		// Wait 100 ns for global reset to finish
				#100;
		A = 9;
		B = 6;
		
		#100;
		A = 7;
		B = 9;
		#100;
		A = 1;
		B = 5;
		#100;
		A = 15;
		B = 15;
		#100;
		A = 7;
		B = 7;
		#100;
		A = 15;
		B = 1;
		#100;
		A = 5;
		B = 10;
		#100;
        
		// Add stimulus here

	end
      
endmodule

