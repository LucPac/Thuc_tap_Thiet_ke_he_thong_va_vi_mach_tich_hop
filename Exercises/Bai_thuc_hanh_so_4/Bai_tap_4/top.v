module topmodule(
                  input wire clk_50M,
						input wire rst,
						input wire pause,
						input wire [1:0] clock_ctrl,
						output wire clk, 
						output wire stb, 
						output wire dio 
                 );
					  
wire clk_giay, clk_phut, clk_gio;
wire [7:0] gio, phut, giay;
//wire clk_1Hz, clk_4Hz, clk_8Hz, clk_16Hz;

clock_generate chia_clock (.clk(clk_50M), .q({clk_1Hz, clk_4Hz, clk_8Hz, clk_16Hz}));
multiplexer chon_clk (clk_1Hz, clk_4Hz, clk_8Hz, clk_16Hz, clock_ctrl, clk_giay);
CLOCK dongho (clk_giay, rst, pause, giay, phut, gio);

wire clk_khz,clk_hz;
wire [3:0] ones1,tens1,hundreds1 ;
wire [3:0] ones2,tens2,hundreds2 ;
wire [3:0] ones3,tens3,hundreds3 ;
wire [4:0] seg [7:0];

ClockDiv clock (clk_50M, clk_khz,clk_hz);

HexBcd   	hex_bcd1 (giay,ones1,tens1,hundreds1);
HexBcd 		hex_bcd2 (phut,ones2,tens2,hundreds2);
HexBcd 		hex_bcd3 (gio,ones3,tens3,hundreds3);
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
