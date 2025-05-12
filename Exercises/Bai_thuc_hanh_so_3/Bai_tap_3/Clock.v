module Clock
	#(parameter N= 29, M = 50000000) 
	(input wire clk,
	output wire clk_1hz, clk_khz
	);
// signal declaration
	reg [N-1:0] r_reg1Hz,r_regkhz;
	wire [N-1:0] r_next1Hz, r_nextkhz;
// body, register
	always @(posedge clk) 
		begin
		r_reg1Hz<=r_next1Hz;
		r_regkhz<=r_nextkhz;
		end
	
	// next state logic
	assign r_next1Hz = (r_reg1Hz==M)?0:r_reg1Hz + 1;
	assign r_nextkhz = (r_regkhz== M/1000)?0:r_regkhz +1;
	
	// output logic
	assign clk_1hz = (r_reg1Hz<M/2)?0:1;
	assign clk_khz = (r_regkhz<M/2000)?0:1;
	
endmodule
