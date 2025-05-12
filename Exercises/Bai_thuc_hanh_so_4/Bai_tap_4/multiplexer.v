module multiplexer(
                      input wire clk_1Hz,
							 input wire clk_4Hz,
							 input wire clk_8Hz,
							 input wire clk_16Hz,
                      input wire [1:0] count_freq_select,
							 output wire clk_selected
                      );  
							 assign clk_selected = (count_freq_select == 2'b00) ? clk_1Hz :
                            (count_freq_select == 2'b01) ? clk_4Hz :
                            (count_freq_select == 2'b10) ? clk_8Hz :
                             clk_16Hz;
endmodule
