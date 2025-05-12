module top(
    input clk_50M, sw,
    //input s,
    input wire rst,
    output x1,v1,d1,x2,v2,d2,
	 		output wire stb,
			output wire dio
    );
	wire [5:0] in1,in2;
	wire clk_demux1, clk_demux2;
	
	Clock clock(.clk(clk_50M), .clk_1hz(clk_1hz), .clk_khz(clk_khz));

	Demux_1to2 demux(.clk(clk_1hz), .sw(sw), .q1(clk_demux1), .q2(clk_demux2));

trafficlight trafficlight (	
		.out(in1), 
		.Clk(clk_demux1), 
		.reset(rst)
	);
	
HexBcd hexbcd(.hex(in1), .ones(ones), .tens(tens), .hundreds(hundreds));

		wire [4:0] seg[7:0];
		
TM1638 tm (8'b1, ones, tens, hundreds, 15, 15, 15, 15, 15,
			clk_khz,
			clk,
			stb,
			dio
			);
			
ledchoptat ledchoptat (
		.clk(clk_demux2), 
		.reset(rst), 
		.out(in2)
	);
	
/*mux2_1 mux2_1 (
		.in0(in1), 
		.in1(in2), 
		.s(s), 
		.out(q)
	);*/
	
/*ledhienthi ledhienthi (
		.q(q), 
		.x1(x1), 
		.v1(v1), 
		.d1(d1), 
		.x2(x2), 
		.v2(v2), 
		.d2(d2)
	);*/
ledhienthi ledhienthi (
		.q(in2), 
		.x1(x1), 
		.v1(v1), 
		.d1(d1), 
		.x2(x2), 
		.v2(v2), 
		.d2(d2)
		);	

endmodule
