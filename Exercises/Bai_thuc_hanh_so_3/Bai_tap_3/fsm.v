/*module fsm
	(
	output RA,
	output YA,
	output GA,
	output RB,
	output YB,
	output GB,
	output reg ST,
	input TS,
	input TL,
	input reset,
	input Clk
	);
	
	reg [6:1] state;
	
	parameter GR= 6'b001100;//do1 - vang1 - xanh1 - do2 - vang2 - xanh2
	parameter YR= 6'b010100;
	parameter RG= 6'b100001;
	parameter RY= 6'b100010;
	
	assign RA = state[6];
	assign YA = state[5];
	assign GA = state[4];
	assign RB = state[3];
	assign YB = state[2];
	assign GB = state[1];
		
	initial 
		begin 
			state = GR; ST = 1; 
		end
		
	always @(posedge Clk)
		begin
			if (reset)
				begin
					state = GR; ST = 1;
				end
			else
				begin
					ST = 0;
					case (state)
						GR:
							if (TL) begin state = YR; ST = 1; end
						YR:
							if (TS) begin state = RG; ST = 1; end
						RG:
							if (TL) begin state = RY; ST = 1; end
						RY:
							if (TS) begin state = GR; ST = 1; end
					endcase
				end
		end
		
endmodule*/

module fsm
	(
	output RA,
	output YA,
	output GA,
	output RB,
	output YB,
	output GB,
	output reg ST,
	input TS1,
	input TL1,
	input TS2,
	input TL2,
	input reset,
	input Clk
	);
	
	reg [6:1] state;
	
	parameter GR= 6'b001100;//do1 - vang1 - xanh1 - do2 - vang2 - xanh2
	parameter YR= 6'b010100;
	parameter RG= 6'b100001;
	parameter RY= 6'b100010;
	
	assign RA = state[6];
	assign YA = state[5];
	assign GA = state[4];
	assign RB = state[3];
	assign YB = state[2];
	assign GB = state[1];
		
	initial 
		begin 
			state = GR; ST = 1; 
		end
		
	always @(posedge Clk)
		begin
			if (reset)
				begin
					state = GR; ST = 1;
				end
			else
				begin
					ST = 0;
					case (state)
						GR:
							if (TL1) begin state = YR; ST = 1; end
						YR:
							if (TS1) begin state = RG; ST = 1; end
						RG:
							if (TL2) begin state = RY; ST = 1; end
						RY:
							if (TS2) begin state = GR; ST = 1; end
					endcase
				end
		end
		
endmodule
