/*module trafficlight 
	(
	output [5:0] out,
	input reset,
	input Clk
	);
	
	timer part1 (TS, TL, ST, Clk);
	fsm part2(RA, YA, GA, RB, YB, GB, ST, TS, TL, reset, Clk);
	
	assign out[0]= GA;
	assign out[1]= YA;
	assign out[2]= RA ;
	assign out[3]= GB ;
	assign out[4]= YB ;
	assign out[5]= RB ;
	
endmodule*/

module trafficlight 
	(
	output [5:0] out,
	input reset,
	input Clk
	);
	
	timer part1 (TS1, TL1, TS2, TL2, ST, Clk);
	fsm part2(RA, YA, GA, RB, YB, GB, ST, TS1, TL1, TS2, TL2, reset, Clk);
	
	assign out[0]= GA;
	assign out[1]= YA;
	assign out[2]= RA ;
	assign out[3]= GB ;
	assign out[4]= YB ;
	assign out[5]= RB ;
	
endmodule

