module Clock_div
#(parameter N= 29, M = 50000000) 
(input wire clk,
output wire q_khz,
output wire [3:0]q
);
// signal declaration
	reg [N-1:0] r_reg1Hz,r_reg2Hz,r_reg4Hz,r_reg8Hz,r_regkhz;
	wire [N-1:0] r_next1Hz,r_next2Hz,r_next4Hz,r_next8Hz, r_nextkhz;
// body, register
	always @(posedge clk) begin
		r_reg1Hz<=r_next1Hz;
		r_reg2Hz<=r_next2Hz;
		r_reg4Hz<=r_next4Hz;
		r_reg8Hz<=r_next8Hz;
		r_regkhz<=r_nextkhz;
		end
	
	// next state logic
	assign r_next1Hz = (r_reg1Hz==M)?0:r_reg1Hz + 1;
	assign r_next2Hz = (r_reg2Hz==M/2)?0:r_reg2Hz + 1;
	assign r_next4Hz = (r_reg4Hz==M/4)?0:r_reg4Hz + 1;
	assign r_next8Hz = (r_reg8Hz==M/8)?0:r_reg8Hz +1;
	assign r_nextkhz = (r_regkhz== M/1000)?0:r_regkhz +1;
	
	// output logic
	assign q[0]=(r_reg1Hz<M/2)?0:1;
	assign q[1]=(r_reg2Hz<M/4)?0:1;
	assign q[2]=(r_reg4Hz<M/8)?0:1;
	assign q[3]=(r_reg8Hz<M/16)?0:1;
	assign q_khz = (r_regkhz<M/2000)?0:1;
	
endmodule