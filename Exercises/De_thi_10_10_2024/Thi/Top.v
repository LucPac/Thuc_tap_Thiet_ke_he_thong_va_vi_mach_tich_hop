module Top		(

		input clk_50,
		input wire [1:0] sw,
		output wire clk,
		output wire stb,
		output wire dio,
		output wire [11:0] led
					);
	
   wire [11:0] in0, in1, in2;
	wire clk_2sec, clk_1sec, clk_khz;
	
	//Clock 	clock ( .clk(clk_50),.clkout({clk1, clk2, clk3, clk4}));
	Clock 	clock ( .clk(clk_50),.clk_2sec(clk_2sec), .clk_1sec(clk_1sec), .clk_khz(clk_khz));
	
	Counter_to999 mode1  (.clk(clk_2sec),.q(in0));
	Counter_down  mode2  (.clk(clk_1sec), .cnt(in0), .q(in1));
	Counter_to20  mode3  (.clk(clk_1sec),.q(in2));
	
	Mux_3to1  mux3_1 (.mode0(in0), .mode1(in1), .mode2(in2), .sw(sw), .q(led));
	
	wire [11:0] ones,tens,hundreds;
	
	HexBcd  hexbcd (.hex(led), .ones(ones), .tens(tens), .hundreds(hundreds));
	
	wire [4:0] seg[7:0];
	
	TM1638 tm (8'b1, ones, tens, hundreds, 15, 15, 15, 15, 15,
			clk_khz,
			clk,
			stb,
			dio
			);
endmodule