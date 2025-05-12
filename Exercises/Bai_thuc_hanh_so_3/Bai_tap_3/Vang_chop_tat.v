module ledchoptat
	(
    input clk,
	 input reset,
    output reg [0:5] out
    );
	
	 initial out = 0;
	 
	always @(posedge clk, posedge reset) 
		if (reset)
			begin
				out[1] = 0;			//VANG1
				out[4] = 0;			//VANG2
			end
		else 
			begin
				out[1] = ~out[1];	//VANG1
				out[4] = ~out[4];	//VANG2
			end
			
endmodule
