module mux2_1
	(
    input [5:0] in0,
    input [5:0] in1,
    input s,
    output [5:0] out
    );

	reg [5:0] y=0;
	
	always @(*)
		begin
			y= s ? in1 : in0;
		end
		
	assign out = y;
	
endmodule
