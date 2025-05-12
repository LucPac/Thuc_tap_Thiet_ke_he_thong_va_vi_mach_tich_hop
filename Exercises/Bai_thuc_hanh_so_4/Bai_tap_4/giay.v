module giay
	(
   input wire clki,
	input wire rst,
	input wire pause,
	output reg [7:0] cnt_giay
            );
				
initial cnt_giay =0;

	always@(posedge clki or posedge rst)
		begin
			if(rst) 
				begin 
					cnt_giay <= 8'b0;
				end
			else 
				begin
					if(pause) 
						cnt_giay <= cnt_giay;
					else
						begin
							if(cnt_giay == 8'd59) 
								begin 
									cnt_giay <= 8'b0; 
								end
							else
								begin
									cnt_giay <= cnt_giay + 1;
								end
						end
				end		   
		end
	
endmodule
