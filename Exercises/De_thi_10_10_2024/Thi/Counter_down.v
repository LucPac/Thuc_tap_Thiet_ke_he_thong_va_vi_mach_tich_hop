module Counter_down(
	
	input [11:0] cnt,
	input clk,
	output [11:0] q
	
    );

	reg [11:0] r_reg;
	wire [11:0] r_next;
	
	initial r_reg = cnt;
	
	always @(posedge clk)
		begin
			r_reg <= r_next;
		end
		
	assign r_next = (r_reg==0)? r_reg : r_reg - 1;
	assign q=r_reg;
endmodule
