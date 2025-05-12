/*module Top(
		input clk_50M,
		input button,
		input wire sw1, sw2, mode,//sw1: chia xung, sw2: select mode
		input wire pause,
		input wire rst,
		output wire clk_hz,
		output wire clk,
		output wire stb,
		output wire dio
    );
		wire clk_khz, clk_2hz, clk_10hz;
		wire [7:0] q1,q2,q;
		wire [3:0] clko;
		wire [3:0] ones,tens,hundreds;
		
		Mode1 					mode1(.btn(button), .reset(rst), .clk(clk_50M), .q(q1));
		
		Clock 					clock(.clk(clk_50M), .clk_khz(clk_khz), .clk_2hz(clk_2hz), .clk_10hz(clk_10hz));
		Mux_2to1 				mux(.clk_2hz(clk_2hz), .clk_10hz(clk_10hz), .sw(sw1), .clk_o(clk_hz));
		Mode2 					mode2(.clk(clk_hz), .pause(pause), .rst(rst), .q(q2));
		
		Mux_select_mode		select_mode(.mode1(q1), .mode2(q2), .sw(sw2), .q(q));
		
		HexBcd  					hexbcd (.hex(q), .ones(ones), .tens(tens), .hundreds(hundreds));
		
		wire [4:0] seg[7:0];
		
		TM1638 tm (8'b11111111, 15, 15, 15, 15, 15,ones, tens, hundreds,
			clk_khz,
			clk,
			stb,
			dio
			);
endmodule*/



module Top(
		input clk_50M,
		input button,//tao xung clock khi nhan
		input wire sw1, sw2, mode,//sw1: chia xung, sw2: select mode
		input wire pause,
		input wire rst,
		output wire clk_hz,
		output wire clk,
		output wire stb,
		output wire dio
    );
		wire clk_khz, clk_2hz, clk_10hz;
		wire [7:0] q1,q2,q;
		wire [3:0] clko;
		wire [3:0] ones,tens,hundreds;
		
		Mode1 					mode1(.btn(button), .reset(rst), .clk(clk_50M), .q(q1));
		
		Clock 					clock(.clk(clk_50M), .clk_khz(clk_khz), .clk_2hz(clk_2hz), .clk_10hz(clk_10hz));
		Mux_2to1 				mux21(.clk({clk_2hz, clk_10hz}), .sw(sw1), .clk_o(clk_hz));
		
		Mode2 					mode2(.clk(clk_hz), .pause(pause), .rst(rst), .q(q2));
		Mux_select_mode		select_mode(.mode1(q1), .mode2(q2), .sw(sw2), .q(q));
		
		HexBcd  					hexbcd (.hex(q), .ones(ones), .tens(tens), .hundreds(hundreds));
		
		wire [4:0] seg[7:0];
		
		TM1638 tm (8'b11111111, 15, 15, 15, 15, 15,ones, tens, hundreds,
			clk_khz,
			clk,
			stb,
			dio
			);
endmodule