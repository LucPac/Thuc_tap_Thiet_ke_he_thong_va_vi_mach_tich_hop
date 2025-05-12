/*module Mode_2(clk,rst,out);

	input  wire    clk, rst;
	output  wire [7:0]   out;

	wire  s_in;
	reg [7:0] reg_out;
	wire [7:0] reg_next;

	always @(posedge clk or negedge rst)
		begin
			if (!rst) reg_out <= 8'b0;
			else reg_out <= reg_next;
		end
		
	assign s_in = ~reg_out[0];
	assign reg_next = {s_in, reg_out[7:1]};
	assign out= reg_out;

endmodule*/

module Mode_2(clk,rst,out);

	input  wire    clk, rst;
	output  wire [7:0]   out;

	wire  s_in;
	reg [7:0] reg_out;
	wire [7:0] reg_next;

	always @(posedge clk or negedge rst)
		begin
			if (!rst) reg_out <= 8'b0;
			else reg_out <= reg_next;
		end
		
	assign s_in = ~reg_out[0];
	assign reg_next = {s_in, reg_out[7:1]};
	assign out= reg_out;

endmodule

