module Top(
		input clk_50M,
		input wire [1:0] sw,
		input wire mode,
		input wire rst,
		output wire clk_hz,
		output wire clk,
		output wire stb,
		output wire dio
    );
		wire clk_khz;
		wire [7:0] q;
		wire [3:0]clko;
		wire [3:0] ones,tens;
		wire clk_2hz, clk_4hz, clk_8hz, clk_16hz;
		
		Clock clock (.clk(clk_50M),.rst(rst),.clk_2Hz(clk_2Hz), .clk_4Hz(clk_4Hz), .clk_8Hz(clk_8Hz), .clk_16Hz(clk_16Hz));
		Mux_4to1 mux (.clk({clk_2Hz,clk_4Hz,clk_8Hz,clk_16Hz}), .sw(sw), .clk_o(clk_hz));
		Counter_to29 counter(.clk(clk_hz), .mode(mode),.rst(rst), .q(q));
		HexBcd  hexbcd (.hex(q), .ones(ones), .tens(tens));
		
		wire [4:0] seg[7:0];
		
		//Clock_for_TM1638(.clk(clk_50M), clk_khz,clk_hz);
		Clock_for_TM1638 Clock_for_TM1638(.clk(clk_50M), .clk_khz(clk_khz));
		TM1638 tm (8'b1, ones, tens, 15, 15, 15, 15, 15, 15,
			clk_khz,
			clk,
			stb,
			dio
			);
endmodule