module den_giao_thong(clk_50,sw0,X1,V1,D1,X2,V2,D2,nhapnhap,clk,stb,dio);

	input			clk_50;
	input			sw0;
	output 		X1,V1,D1,X2,V2,D2,nhapnhap;
   output wire clk;
   output wire stb;
   output wire dio;
	wire clk_khz,clk_hz;
	//output reg [5:0]	Hex0;
	//output reg [5:0]	Hex1;
	wire 	[5:0]	cnt_up;
	wire 	[5:0]	cnt_down;
	wire		clock;
	wire [3:0] ones1,tens1,hundreds1 ;
   wire [3:0] ones2,tens2,hundreds2 ;
	
	chia_xung	CLOCK (.clk_in(clk_50),.rst(sw0),.clk_out(clock));
	assign nhapnhay = clock;
	ClockDiv div_clk (.clki(clk_50),.clk_khz(clk_khz),.clk_hz(clk_hz));
	
	dieukhien  dieu_khien(.clock (clock),.rst(sw0),.X1 (X1),.D1 (D1),.V1 (V1),.X2 (X2),.D2 (D2),.V2 (V2),.cnt_up (cnt_up),.cnt_down(cnt_down));
	
	HexBcd  hex_bcd1 (.hex(cnt_up),.ones1(ones1),.tens1(tens1),.hundreds1(hundreds1));
   HexBcd  hex_bcd2 (.hex(cnt_down),.ones2(ones2),.tens2(tens2),.hundreds2(hundreds2));
	
	wire [4:0] seg [7:0];
	TM1638 tm(8'b1,ones1,tens1,hundreds1,15,15,ones2,tens2,hundreds2,
	clk_khz,
	clk,
	stb,
	dio);
	
endmodule 