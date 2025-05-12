module Led_4_Mode(clk_50,rst,sw,mode,led);

	input clk_50;
	input wire rst;
	input wire [1:0] sw;
	input wire [1:0] mode;
	output wire [7:0] led;
   wire clk1,clk2,clk3,clk4;
	wire clk_demux1, clk_demux2, clk_demux3, clk_demux4; 
   wire clk_in;
   wire [7:0] in1, in2, in3, in4;
	clock_1hz2hz4hz8hz 	clock ( .clk(clk_50),.rst(rst),.clkout({clk1, clk2, clk3, clk4}));
	
	Mux_4_to_1 	mux (.clk({clk1, clk2, clk3, clk4}),.sw(sw),.clk_o(clk_in));
	
	Demux_1_to_4 	demux (.clk(clk_in),.mode(mode),.out1(clk_demux1),.out2(clk_demux2),.out3(clk_demux3),.out4(clk_demux4));
	Mode_1 mode1  (.clk(clk_demux1),.rst(rst),.out(in1));
	Mode_2 mode2  (.clk(clk_demux2),.rst(rst),.out(in2));
	Mode_3 mode3  (.clk(clk_demux3),.rst(rst),.out(in3));
	Mode_4 mode4  (.clk(clk_demux4),.rst(rst),.out1(in4[3:0]),.out2(in4[7:4]));
	
	mux4to1  mux4_1 (.in1(in1),.in2(in2),.in3(in3),.in4(in4),.mode(mode),.out(led));
	
endmodule