`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:27:39 11/02/2024 
// Design Name: 
// Module Name:    Macch_chia_xung_50hz_thanh_4_xung_clock_f_2f_4f_8f 
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
module Clock_div 
   #(parameter N= 30, M = 50000000) // 50,000,000 for 1Hz  
 ( input wire clk, 
   output wire   [3:0]q 
    ); 
  // signal declaration 
   
  reg [N-1:0] r_reg_f,r_reg_2f,r_reg_4f,r_reg_8f; 
  wire [N-1:0] 
r_next_f,r_next_2f,r_next_4f,r_next_8f; 
   
  // body, register 
  always @(posedge clk) begin 
  r_reg_f<=r_next_f; 
  r_reg_2f<=r_next_2f; 
  r_reg_4f<=r_next_4f; 
  r_reg_8f<=r_next_8f; 
  end 
 // next state logic 
 assign r_next_f = (r_reg_f==M)?0:r_reg_f + 1; 
 assign r_next_2f = (r_reg_2f==M/2)?0:r_reg_2f + 1; 
 assign r_next_4f = (r_reg_4f==M/4)?0:r_reg_4f + 1; 
 assign r_next_8f = (r_reg_8f==M/8)?0:r_reg_8f + 
1;  
// output logic  
 assign q[0]=(r_reg_f<M/2)?0:1; 
 assign q[1]=(r_reg_2f<M/4)?0:1; 
 assign q[2]=(r_reg_4f<M/8)?0:1; 
 assign q[3]=(r_reg_8f<M/16)?0:1; 
 
endmodule 


