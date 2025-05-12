module Clock(

	input clk,
	output wire clk_2sec, clk_1sec, clk_khz
	
    );
	 
	reg [25:0] counter_2sec;
	reg [24:0] counter_1sec;
	reg [14:0] counter_khz;
	
	always @(posedge clk)
		begin
			counter_2sec <= counter_2sec + 1;
			counter_1sec <= counter_1sec + 1;
			counter_khz <= counter_khz + 1;
		end
		
	assign clk_2sec = counter_2sec[25];
	assign clk_1sec = counter_1sec[24];
	assign clk_khz = counter_khz[14];

endmodule
