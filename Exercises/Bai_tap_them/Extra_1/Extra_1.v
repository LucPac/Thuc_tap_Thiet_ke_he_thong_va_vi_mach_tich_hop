`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:21 10/27/2024 
// Design Name: 
// Module Name:    Extra_1 
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
module Extra_1(req, code_out, valid);

	input wire [3:0] req;
	output wire [1:0] code_out;
	output wire valid;
	
	wire [1:0] mux3;
	wire [1:0] mux2;
	wire [1:0] mux1;
	
	Mux_2_to_1 al (2'b00, 2'b11, req[3], mux3);
	Mux_2_to_1 a2 (mux3, 2'b10, req[2], mux2);
	Mux_2_to_1 a3 (mux2, 2'b01, req[1], mux1);
	Mux_2_to_1 a4 (mux1, 2'b00, req[0], code_out);
	assign valid = req[3] | req[2] | req[1] | req[0];
	
endmodule
