module mux4to1(in1,
    in2,
    in3,
    in4,
    mode,
    out
    );
	input wire  [7:0]   in1, in2, in3, in4;
	input wire [1:0]  mode;
	output reg  [7:0]  out;
	always @(*)
	begin
		case (mode)
			2'b00: out = in1;
			2'b01: out = in2;
			2'b10: out = in3;
			2'b11: out = in4;
			default: out = in1;
		endcase
	end
endmodule
