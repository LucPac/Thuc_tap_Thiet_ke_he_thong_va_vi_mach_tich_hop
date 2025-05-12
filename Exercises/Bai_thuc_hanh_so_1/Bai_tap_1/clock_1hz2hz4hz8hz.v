module clock_1hz2hz4hz8hz(
    input clk,
    input rst,
    output [3:0] clkout
    );

		clock_generate  gen1hz  (clk,rst,clkout[0]);

		clock_generate  gen2hz  (clk,rst,clkout[1]);
				defparam gen2hz.div = 12500000;

		clock_generate  gen3hz  (clk,rst,clkout[2]);
				defparam gen3hz.div = 6250000;

		clock_generate  gen4hz  (clk,rst,clkout[3]);
				defparam gen4hz.div = 3125000;
				
//		clock_generate  gen5hz  (clk,rst,clkout[4]);
//				defparam gen5hz.div = 1562500;	
endmodule