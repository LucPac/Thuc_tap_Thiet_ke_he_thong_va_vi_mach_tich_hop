`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:28 09/28/2023 
// Design Name: 
// Module Name:    demonsevenled 
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


module topTM1638(input clk_50M,
output wire clk,
output wire stb,
output wire dio,
input wire [7:0] gio,
input wire [7:0] phut,
input wire [7:0] giay
						);
wire clk_khz,clk_hz;

wire [3:0] ones1,tens1,hundreds1 ;
wire [3:0] ones2,tens2,hundreds2 ;
wire [3:0] ones3,tens3,hundreds3 ;

ClockDiv clock (clk_50M, clk_khz,clk_hz);

HexBcd   	hex_bcd1 (giay,ones1,tens1,hundreds1);
HexBcd 		hex_bcd2 (phut,ones2,tens2,hundreds2);
HexBcd 		hex_bcd3 (gio,ones3,tens3,hundreds3);

wire [4:0] seg [7:0];

TM1638 tm (8'b11111111,ones1,tens1,15,ones2,tens2,15,ones3,tens3,clk_khz,
							clk,
							stb,
							dio
							);
endmodule
////////////////////////////////////////////////////
module ClockDiv(
input wire clki,
output wire clk_khz,clk_hz
);
wire [26:0] r_next ;
reg [26:0] r_reg;
initial begin r_reg =0 ;end
always @(posedge clki)
r_reg = r_next;
assign r_next =(r_reg==50000000)?0: r_reg + 1 ;
assign clk_khz=r_reg[5]; /*781.250 Khz*/
assign clk_hz=(r_reg<=50000000/2)?0:1; /*781.250 Khz*/
endmodule


//////////////////////////////////////////////////////
module add3(in,out);
input [3:0] in;
output [3:0] out;
reg [3:0] out;
always @ (in)
case (in)
4'b0000: out <= 4'b0000;
4'b0001: out <= 4'b0001;
4'b0010: out <= 4'b0010;
4'b0011: out <= 4'b0011;
4'b0100: out <= 4'b0100;
4'b0101: out <= 4'b1000;
4'b0110: out <= 4'b1001;
4'b0111: out <= 4'b1010;
4'b1000: out <= 4'b1011;
4'b1001: out <= 4'b1100;
default: out <= 4'b0000;
endcase
endmodule

////////////////////////////////////////////////////////
module HexBcd(
input [7:0] hex,
output wire [3:0] ones,
output wire [3:0] tens,
output wire [3:0] hundreds
);
wire [3:0] c1,c2,c3,c4,c5,c6,c7;
wire [3:0] d1,d2,d3,d4,d5,d6,d7;
assign d1 = {1'b0,hex[7:5]};
assign d2 = {c1[2:0],hex[4]};
assign d3 = {c2[2:0],hex[3]};
assign d4 = {c3[2:0],hex[2]};
assign d5 = {c4[2:0],hex[1]};
assign d6 = {1'b0,c1[3],c2[3],c3[3]};
assign d7 = {c6[2:0],c4[3]};
add3 m1(d1,c1);
add3 m2(d2,c2);
add3 m3(d3,c3);
add3 m4(d4,c4);
add3 m5(d5,c5);
add3 m6(d6,c6);
add3 m7(d7,c7);
assign ones = {c5[2:0],hex[0]};
assign tens = {c7[2:0],c5[3]};
assign hundreds = {c6[3],c7[3]};
endmodule
///////////////////////////////////////////////////

module TM1638(
input wire [7:0] led , // 8 leds
input wire [3:0] seg7,seg6,seg5,seg4,seg3,seg2,seg1,seg0 ,//4 bit data for cathodecommond LED
input clkinput,
output reg clk,
output reg stb,
output reg dio
);
/* Hex-Digit to seven segment LED decoder
Author: Mr. Son
*/
function [7:0] sseg;
input [3:0] hex;
begin
case (hex)
4'h0: sseg[7:0] = 8'b0111111;
4'h1: sseg[7:0] = 8'b0000110;
4'h2: sseg[7:0] = 8'b1011011;
4'h3: sseg[7:0] = 8'b1001111;
4'h4: sseg[7:0] = 8'b1100110;
4'h5: sseg[7:0] = 8'b1101101;
4'h6: sseg[7:0] = 8'b1111101;
4'h7: sseg[7:0] = 8'b0000111;
4'h8: sseg[7:0] = 8'b1111111;
4'h9: sseg[7:0] = 8'b1101111;
4'hA: sseg[7:0] = 8'b1110111;
4'hB: sseg[7:0] = 8'b1111100;
4'hC: sseg[7:0] = 8'b1011000;
4'hD: sseg[7:0] = 8'b1011110;
4'hE: sseg[7:0] = 8'b1111001;
default : sseg[7:0] = 8'b0000000; // 4'hF
endcase
end
endfunction
integer cs = 0;
integer i ;
reg [7:0] command1 =8'h40, command2 =8'hC0,command3 =8'h8F;
wire [127:0] leddata; // 1,3,5,7,9,11,13,15: single led; 0,2,4,6,8,10,12,14: seg LED (commoncathode)
reg [127:0] leddatahold;
assign leddata[0*8+7:0*8+0] = sseg(seg0);
assign leddata[2*8+7:2*8+0] = sseg(seg1);
assign leddata[4*8+7:4*8+0] = sseg(seg2);
assign leddata[6*8+7:6*8+0] = sseg(seg3);
assign leddata[8*8+7:8*8+0] = sseg(seg4);
assign leddata[10*8+7:10*8+0] = sseg(seg5);
assign leddata[12*8+7:12*8+0] = sseg(seg6);
assign leddata[14*8+7:14*8+0] = sseg(seg7);
assign leddata[1*8+7:1*8+0] = led[0] ;
assign leddata[3*8+7:3*8+0] = led[1] ;
assign leddata[5*8+7:5*8+0] = led[2] ;
assign leddata[7*8+7:7*8+0] = led[3] ;
assign leddata[9*8+7:9*8+0] = led[4] ;
assign leddata[11*8+7:11*8+0] = led[5] ;
assign leddata[13*8+7:13*8+0] = led[6] ;
assign leddata[15*8+7:15*8+0] = led[7] ;
initial
begin
clk = 1 ;
stb = 1 ;
dio = 0 ;
end

always @(posedge clkinput)
begin
if (cs==0)
begin
stb = 0; // initial tm1638
command1 =8'h40; command2 =8'hC0;command3 =8'h8F;
leddatahold=leddata ;
end
else if ((cs >=1)&&(cs<=16))
begin
dio = command1[0];
clk = ~clk ;
if (clk) command1=command1>>1 ;
end
else if (cs==17)
stb = 1; // stop tm1638
else if (cs==18)
stb = 0; // ready to send the second command
// send second command
else if ((cs >=19)&&(cs<=34))
begin
dio = command2[0];
clk = ~clk ;
if (clk) command2=command2>>1 ;
end
else if ((cs >=35)&&(cs<=290))
begin
dio = leddatahold[0];
clk = ~clk ;
if (clk) leddatahold=leddatahold>>1 ;
end
else if (cs==291)
stb = 1; // stop tm1638 for end of data
else if (cs==292)
stb = 0; // ready to send the third command
// send last command
else if ((cs >=293)&&(cs<=308))
begin
dio = command3[0];
clk = ~clk ;
if (clk) command3=command3>>1 ;
end
else if (cs==309)
stb = 1; // End
else if (cs==310)
cs = -1 ; //repeat
// update cs
cs=cs+1;
end
endmodule