module CLOCK 
	(
    input wire clk_out,    
    input wire rst,        
    input wire pause,      
    output wire [7:0] giay,
    output wire [7:0] phut, 
    output wire [7:0] gio    
	);
	
	wire tick_seconds;   
	wire tick_minutes;   

	giay dem_giay (clk_out, rst, pause, giay);
	assign tick_seconds = (giay == 8'd59);// luc dau tick_second = 0 nhung khi giay dat den 59 giay thi tick_second = 1, tao thanh xung lock cap vao module phut
	phut dem_phut (tick_seconds, rst, phut);
	assign tick_minutes = (giay == 8'd59) && (phut == 8'd59);
	gio dem_gio (tick_minutes, rst, gio);	// luc dau tick_minutes = 0 nhung khi phut dat den 59 phut thi tick_minutes = 1, tao thanh xung lock cap vao module phut 

endmodule
