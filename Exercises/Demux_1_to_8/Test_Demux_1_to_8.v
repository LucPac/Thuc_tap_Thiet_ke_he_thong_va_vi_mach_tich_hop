`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:21:26 10/25/2024
// Design Name:   Demux_1_to_8
// Module Name:   D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Demux_1_to_8/Demux_1_to_8/Test_Demux_1_to_8.v
// Project Name:  Demux_1_to_8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Demux_1_to_8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Demux_1_to_8;

	// Inputs
	reg I;
	reg [2:0] S;

	// Outputs
	wire [7:0] Y;

	// Instantiate the Unit Under Test (UUT)
	Demux_1_to_8 uut (
		.I(I), 
		.S(S), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		I = 0;
		S = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	
	always
		begin
			I =~ I;
			#100;
		end
			
	always
		begin
			#100;
			S=S+1;
		end
      
endmodule

