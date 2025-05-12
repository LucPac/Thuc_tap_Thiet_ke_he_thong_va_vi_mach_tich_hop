/*module Mode_1(clk,rst,out);

	input clk,rst;
	output wire [7:0] out;
	wire [7:0] reg_next;
	reg [7:0] reg_out;
 
	always @(posedge clk or negedge rst)
		begin
			if (!rst)
				reg_out <= 8'b0;
			else
				reg_out <= reg_next;
		end
		
	assign reg_next = ~ reg_out;
	assign out = reg_out;
	
endmodule*/

module Mode_1(clk,rst,out);

	input clk,rst;
	output wire [7:0] out;
	wire [7:0] reg_next;
	reg [7:0] reg_out;
 
	always @(posedge clk or negedge rst)
		begin
			if (!rst)
				reg_out <= 8'b0;
			else
				reg_out <= reg_next;
		end
		
	assign reg_next = ~ reg_out;
	assign out = reg_out;
	
endmodule
