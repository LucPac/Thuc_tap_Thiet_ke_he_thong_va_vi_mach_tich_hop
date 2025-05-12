/*module Clock(

	input clk,
	output wire clk_2hz, clk_10hz, clk_khz
	
    );

	reg [23:0] counter_2hz;
	reg [21:0] counter_10hz;
	reg [14:0] counter_khz;
	
	always @(posedge clk)
		begin
			counter_2hz <= counter_2hz + 1;
			counter_10hz <= counter_10hz + 1;
			counter_khz <= counter_khz + 1;
		end
		
	assign clk_2hz = counter_2hz[23];
	assign clk_10hz = counter_10hz[21];
	assign clk_khz = counter_khz[14];
	
endmodule*/


module Clock

	#(parameter N= 29, M = 50000000) 
	(input wire clk,
	output wire clk_khz, clk_2hz, clk_10hz
	);
// signal declaration
	reg [N-1:0] r_reg2Hz, r_reg10Hz, r_regkhz;
	wire [N-1:0] r_next2Hz, r_next10Hz, r_nextkhz;
// body, register
	always @(posedge clk) 
		begin
		r_reg2Hz<=r_next2Hz;
		r_reg10Hz<=r_next10Hz;
		r_regkhz<=r_nextkhz;
		end
	
	// next state logic
	assign r_next2Hz = (r_reg2Hz==M/2)?0:r_reg2Hz + 1;
	assign r_next10Hz = (r_reg10Hz==M/10)?0:r_reg10Hz + 1;
	assign r_nextkhz = (r_regkhz== M/1000)?0:r_regkhz +1;
	
	// output logic
	assign clk_2hz=(r_reg2Hz<M/4)?0:1;
	assign clk_10hz=(r_reg10Hz<M/20)?0:1;
	assign clk_khz = (r_regkhz<M/2000)?0:1;
	
endmodule
