`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:55:01 10/22/2024
// Design Name:   Extra_1
// Module Name:   D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Extra_1/Test_Extra_1.v
// Project Name:  Extra_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Extra_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Extra_1;

	// Inputs
	reg [3:0] req;

	// Outputs
	wire [1:0] code_out;
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	Extra_1 uut (
		.req(req), 
		.code_out(code_out), 
		.valid(valid)
	);

	initial begin
		// Initialize Inputs
		req = 0;

		// Wait 100 ns for global reset to finish
		#100;
		req = 1;
		#100;
		req = 2;
		#100;
		req = 3;
		#100;
		req = 4;
		#100;
		req = 5;
		#100;
		req = 6;
		#100;
		        
		// Add stimulus here

	end
      
endmodule

