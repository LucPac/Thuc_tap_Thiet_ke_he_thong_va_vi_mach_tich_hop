/*module clock_generate(
                            input wire clki,     
									 input wire reset,     
									 output wire clk_1Hz,
									 output wire clk_4Hz,
									 output wire clk_8Hz,
									 output wire clk_16Hz
                      );
    reg [24:0] counter_1Hz = 0; // tai ngo ra thu q_n thi f_in/[2^(n+1)]
    reg [22:0] counter_4Hz = 0;
    reg [21:0] counter_8Hz = 0;
    reg [20:0] counter_16Hz = 0;
	 always @(posedge clki or posedge reset) begin
        if (reset) begin
            counter_1Hz <= 0;
            counter_4Hz <= 0;
            counter_8Hz <= 0;
            counter_16Hz <= 0;
            end else
				begin
            counter_1Hz <= counter_1Hz + 1;
            counter_4Hz <= counter_4Hz + 1;
            counter_8Hz <= counter_8Hz + 1;
            counter_16Hz <= counter_16Hz + 1;
                      end
    end
	 assign clk_1Hz = counter_1Hz[24];  
    assign clk_4Hz = counter_4Hz[22];  
    assign clk_8Hz = counter_8Hz[21];
    assign clk_16Hz = counter_16Hz[20];	 

endmodule*/

module clock_generate
	#(parameter N= 29, M = 50000000) 
	(input wire clk,
	output wire q_khz,
	output wire [3:0] q
	);
// signal declaration
	reg [N-1:0] r_reg1Hz,r_reg16Hz,r_reg4Hz,r_reg8Hz,r_regkhz;
	wire [N-1:0] r_next1Hz,r_next16Hz,r_next4Hz,r_next8Hz, r_nextkhz;
// body, register
	always @(posedge clk) begin
		r_reg1Hz<=r_next1Hz;
		r_reg16Hz<=r_next16Hz;
		r_reg4Hz<=r_next4Hz;
		r_reg8Hz<=r_next8Hz;
		r_regkhz<=r_nextkhz;
		end
	
	// next state logic
	assign r_next1Hz = (r_reg1Hz==M)?0:r_reg1Hz + 1;
	assign r_next16Hz = (r_reg16Hz==M/16)?0:r_reg16Hz + 1;
	assign r_next4Hz = (r_reg4Hz==M/4)?0:r_reg4Hz + 1;
	assign r_next8Hz = (r_reg8Hz==M/8)?0:r_reg8Hz +1;
	assign r_nextkhz = (r_regkhz== M/1000)?0:r_regkhz +1;
	
	// output logic
	assign q[0]=(r_reg1Hz<M/2)?0:1;
	assign q[1]=(r_reg16Hz<M/32)?0:1;
	assign q[2]=(r_reg4Hz<M/8)?0:1;
	assign q[3]=(r_reg8Hz<M/16)?0:1;
	assign q_khz = (r_regkhz<M/2000)?0:1;
	
endmodule
