module gio(
            input wire clki,
				input wire rst,
				output reg [7:0] cnt_gio
            );
initial cnt_gio = 0;
always@(posedge clki)
begin
 if(rst) cnt_gio <= 8'b0;
 else begin
         if(cnt_gio == 8'd23) begin 
			                         cnt_gio <= 8'b0;
			                     end
			else
			  begin
			     cnt_gio <= cnt_gio + 1;
			  end
			end		   
end
endmodule
