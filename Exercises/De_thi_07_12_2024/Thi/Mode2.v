module Mode2(

	input clk,
	input rst,
	input pause,//pause = 1: dung dem, pause = 0: tiep tuc dem
	output [7:0] q
	
    );
	
	reg [7:0] r_reg=0;
	wire [7:0] r_next;
	reg comp;//bien so sanh, 0: dem len, 1: dem xuong
	
	initial r_reg=0;
	
	always @(posedge clk)
		begin 
			if(r_reg == 0) comp<=0;
			else if(r_reg == 28) comp<=1;
			else comp<=comp;
		end
		
	always @(posedge clk)
		begin
			if(rst) r_reg <= 0;
			else r_reg <= r_next;
		end
		
	assign r_next = (pause==1)? r_reg : ((comp==0)?(r_reg + 1) : (r_reg - 1));
	assign q = r_reg;
	
endmodule

/*module Mode2
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

assign r_next = (pause == 1)? r_reg :((set==1)?0:((mode == 0)? (r_reg +1):(r_reg -1)));
assign q=r_reg; 

endmodule*/



