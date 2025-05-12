module Top(
		input clk_50M,
		input wire [1:0] sw,
		input wire mode,
		input wire pause,
		input wire rst,
		output wire clk_hz,
		output wire clk,
		output wire stb,
		output wire dio
    );
		wire clk_khz;
		wire [7:0] q;
		wire [3:0]clko;
		wire [3:0] ones,tens,hundreds;
		
		Clock_div clock (.clk(clk_50M),.q_khz(clk_khz),.q(clko));
		Mux_4_to_1 mux (.clk(clko), .sw(sw), .clk_o(clk_hz));
		counter counter1(.clk(clk_hz), .mode(mode), .pause(pause),.rst(rst), .q(q));
		HexBcd  hexbcd (.hex(q), .ones(ones), .tens(tens), .hundreds(hundreds));
		
		wire [4:0] seg[7:0];
		
		TM1638 tm (8'b1, ones, tens, hundreds, 15, 15, 15, 15, 15,
			clk_khz,
			clk,
			stb,
			dio
			);
endmodule