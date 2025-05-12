module Counter_to29(
	
	input wire clk,
	input wire mode,
	input wire rst,
	output wire [7:0] q
							);

  wire [7:0] r_next;
  reg [7:0] r_reg;
  
  initial r_reg =0 ;
  
  always @(posedge clk)
  begin
	  if(rst)r_reg <= 0;
	  else r_reg <= r_next;
	end
	

	assign r_next = (mode == 0) ? 
                ((r_reg == 29) ? r_reg - 1 : r_reg + 1) : 
                ((r_reg == 0) ? r_reg + 1 : r_reg - 1);

	
	assign q=r_reg; 
endmodule
