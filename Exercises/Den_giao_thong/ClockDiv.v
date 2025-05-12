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