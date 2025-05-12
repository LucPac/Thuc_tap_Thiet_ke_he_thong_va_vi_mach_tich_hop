module Counter_to999(

	input clk,
	output [11:0] q
	
    );
	 
	wire [11:0] r_next;
	reg [11:0] r_reg;
	
	initial r_reg = 0;
	
	always @(posedge clk)
		begin 
			r_reg <= r_next;
		end
			
	assign r_next = (r_reg==999)? r_reg:r_reg + 1;
	assign q = r_reg;

endmodule
