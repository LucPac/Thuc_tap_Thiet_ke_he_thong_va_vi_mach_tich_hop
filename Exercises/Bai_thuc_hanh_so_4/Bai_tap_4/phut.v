module phut(
            input wire clki,
				input wire rst,
				output reg [7:0] cnt_phut
            );
initial cnt_phut = 0;
always@(posedge clki or posedge rst)
begin
 if(rst) begin 
            cnt_phut <= 8'b0;
				
		    end
 else begin
         if(cnt_phut == 8'd59) 
			begin 
		 
			cnt_phut <= 8'b0;
			end
			else
			  begin
			     cnt_phut <= cnt_phut + 1;
				 
			  end
			end		   
end
endmodule