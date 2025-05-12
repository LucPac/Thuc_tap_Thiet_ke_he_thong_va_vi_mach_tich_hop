`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:23:09 10/26/2024 
// Design Name: 
// Module Name:    Demux_1_to_8 
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
module demux1_to_8(
		input din,
		input wire [2:0] sel,
		output reg[7:0] out
    );
always @(sel)
 begin
      case (sel)
		3'b000: out = {7'b0,din};
		3'b001: out = {6'b0,din,1'b0};
		3'b010: out = {5'b0,din,2'b0};
	   3'b011: out = {4'b0,din,3'b0};
		3'b100: out = {3'b0,din,4'b0};
		3'b101: out = {2'b0,din,5'b0};
		3'b110: out = {1'b0,din,6'b0};
		3'b111: out = {din,7'b0};
		default out = 8'b0;
      endcase
 end
endmodule
