module dieukhien(clock,rst,X1,V1,D1,X2,V2,D2,cnt_up,cnt_down);

   parameter S0 = 2'b00; 
	parameter S1 = 2'b01; 
	parameter S2 = 2'b10; 
	parameter S3 = 2'b11;
   input clock,rst;
   output X1,V1,D1,X2,V2,D2;	
	output cnt_up;
	output cnt_down;
	reg X1,V1,D1,X2,V2,D2;	
	reg [1:0] 	state, next_state;
	reg [5:0]	cnt_up;
	reg [5:0]	cnt_down;
	
		//counter_up
		always @ (posedge clock)
		begin 
		if (!rst) cnt_up <= 6'd0;
			else
			case (state)
				S0: //GR
					begin
						if (cnt_up == 6'd27) cnt_up <= 6'd0;
						else
						cnt_up <= cnt_up +1'b1;
					end 
				 S1: //YR
					begin
						if (cnt_up == 6'd3) cnt_up <= 6'd0;
						else
						cnt_up <= cnt_up +1'b1;
					end
					
				 S2: //RG
					begin
						if (cnt_up == 6'd17) cnt_up <= 6'd0;
						else
						cnt_up <= cnt_up +1'b1;
					end 
			  	S3: //RY
					begin
						if (cnt_up == 6'd3) cnt_up <= 6'd0;
						else
						cnt_up <= cnt_up +1'b1;
					end
				default: cnt_up <= 6'd0;
			endcase
		end
		
		// counter_down
		always @ (posedge clock)
		begin 
		if (!rst) cnt_down <= 6'd27;
			else
			case (state)
				S0: //GR
					begin
						if (cnt_down == 6'd0) cnt_down <= 6'd27;
						else
						cnt_down <= cnt_down - 1'b1;
					end 
				S1: //YR
					begin
						if (cnt_down == 6'd0) cnt_down <= 6'd3;
						else
						cnt_down <= cnt_down - 1'b1;
					end
				S2: //RG
					begin
						if (cnt_down== 6'd0) cnt_down<= 6'd17;
						else
						cnt_down <= cnt_down -1'b1;
					end 
				S3: //RY
					begin
						if (cnt_down == 6'd0) cnt_down <= 6'd3;
						else
						cnt_down <= cnt_down- 1'b1;
					end
				default: cnt_down<= 6'd27;
			endcase
		end
		
	always @ (*)
	 begin 
	 	X1 = 1'b0;
		D1	= 1'b0;
		D1 = 1'b0;
		X2	= 1'b0;
		D2	= 1'b0;
		V2	= 1'b0;
		next_state = S0 ;
		case (state)
		S0: 
			begin
				X1 = 1'b1;
				D2 = 1'b1;
				if (cnt_up == 6'd27) next_state = S1;
				else next_state = S0;
			end
		S1: 
			begin
				V1 = 1'b1;
				D2 = 1'b1;
				if (cnt_up == 6'd3) next_state = S2;
				else next_state = S1;
			end
		S2: 
			begin
				D1 = 1'b1;
				X2 = 1'b1;
				if (cnt_up == 6'd17) next_state = S3;
				else next_state = S2;
			end
		S3: 
			begin
				D1 = 1'b1;
				V2 = 1'b1;
				if (cnt_up== 6'd3) next_state = S0;
				else next_state = S3;
			end
		default: 
			begin
				X1 = 1'b1;
				D2 = 1'b1;
				next_state = S0;
			end
		endcase	
	end
	
	always @(posedge clock)
		begin
			if (!rst) state <= S0;
			else state <= next_state;
		end
	
endmodule
