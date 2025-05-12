`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:14 11/02/2024 
// Design Name: 
// Module Name:    Counter_8_bit 
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
module Counter_8_bit
#(parameter N= 8) // 50,000,000 for 1Hz  
 ( input wire clk,reset,ud, 
   output wire   [7:0]q 
    ); 
  // signal declaration   
  reg  [N-1:0] r_reg; 
  wire [N-1:0] r_next;   
  // body, register 
  always @(posedge clk, posedge reset)  
   if (reset) 
   r_reg<=0; 
   else  
   r_reg<=r_next; 
 // next state logic 
 assign r_next = (ud==1)?r_reg + 1:r_reg - 1; 
 // output logic  
 assign q=r_reg; 
endmodule 
