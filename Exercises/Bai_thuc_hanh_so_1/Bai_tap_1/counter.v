module counter
(
input wire clk,
input wire mode,
input wire pause,
input wire rst,
output wire [7:0] q
);
  wire set;
  wire [7:0] r_next;
  reg [7:0] r_reg;
  initial r_reg =0 ;
  always @(posedge clk)
  if(rst)r_reg <= 0;
  else
       r_reg <= r_next;

assign r_next = (pause == 1)? r_reg :((set==1)?0:((mode == 0)? r_reg +1:r_reg -1));
assign q=r_reg; 

endmodule