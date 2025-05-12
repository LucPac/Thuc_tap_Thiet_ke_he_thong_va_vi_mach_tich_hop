`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:18:30 11/08/2024
// Design Name:   Clock_div
// Module Name:   E:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Mach_chia_xung_50hz_thanh_4_xung_clock_f_2f_4f_8f/Test_Clock_div.v
// Project Name:  Mach_chia_xung_50hz_thanh_4_xung_clock_f_2f_4f_8f
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Clock_div
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Clock_div;

	// Inputs
	reg clk;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	Clock_div uut (
		.clk(clk), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish

		// Add stimulus here

	end
	always
		begin
			clk =~ clk;
			#10;
		end
      
endmodule

