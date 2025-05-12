module Clock(
                            input wire clk,     
									 input wire rst,     
									 output wire clk_2Hz,
									 output wire clk_4Hz,
									 output wire clk_8Hz,
									 output wire clk_16Hz
                      );//chia xung 2, 4, 8, 16 hz
    reg [23:0] counter_2Hz = 0; // tai ngo ra thu q_n thi f_in/[2^(n+1)]
    reg [22:0] counter_4Hz = 0;
    reg [21:0] counter_8Hz = 0;
    reg [20:0] counter_16Hz = 0;
	 always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter_2Hz <= 0;
            counter_4Hz <= 0;
            counter_8Hz <= 0;
            counter_16Hz <= 0;
            end else
				begin
            counter_2Hz <= counter_2Hz + 1;
            counter_4Hz <= counter_4Hz + 1;
            counter_8Hz <= counter_8Hz + 1;
            counter_16Hz <= counter_16Hz + 1;
                      end
    end
	 assign clk_1Hz = counter_2Hz[23];  
    assign clk_4Hz = counter_4Hz[22];  
    assign clk_8Hz = counter_8Hz[21];
    assign clk_16Hz = counter_16Hz[20];	 

endmodule
