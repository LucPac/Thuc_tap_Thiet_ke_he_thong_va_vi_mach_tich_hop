/*module Mode_3(out,rst,clk);

	input clk,rst;
	output wire [7:0] out;
	wire   [7:0] reg_next;
	reg   [7:0] reg_out;
	reg     comp;
 
	assign reg_next = (comp == 1'b1) ? (reg_out>>1) : (comp == 1'b0)? (reg_out<<1): reg_next;
	always @(posedge clk or negedge rst)
		begin
			if (!rst)
				reg_out <= 8'b10000000;
			else
				reg_out <= reg_next;
	end
	//assign comp = (reg_out == 8'b10000000) ? 1'b1 : (reg_out == 8'b00000001) ? 1'b0:comp;

	always @(negedge clk or negedge rst)
	begin
	if (!rst)
	 comp = 1;
	 else if (reg_out == 8'b10000000)
	  comp = 1;
		else if (reg_out == 8'b00000001)
		comp = 0;
		 else
		 comp = comp;
	end
	assign out = reg_out;

endmodule*/
	
module Mode_3 (
    input wire clk,
    input wire rst,
    output reg [7:0] out
);
    reg tt;
	 always @(posedge clk or negedge rst) 
	 begin
        if (!rst) 
            out <= 8'b10000000;  
        else 
            out <= tt ? (out >> 1) : (out << 1);  
    end
	  always @(negedge clk or negedge rst) 
	  begin
        if (!rst) 
		  tt <= 1; 
        else if (out == 8'b10000000) 
            tt <= 1; 
        else if (out == 8'b00000001) 
            tt <= 0;  
    end
endmodule
		
	