`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:59:07 10/26/2024 
// Design Name: 
// Module Name:    dem_den_k 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dem_den_k(rs, clk, /*clk_out, clk_50,*/ state);

    parameter n = 6;             
    parameter k = 59;
	 
    input rs, clk/*, clk_out, clk_50*/;
    output reg [n-1:0] state;    
	 
    wire [n-1:0] next;
    wire equal;
	 
    assign equal = (state == k) ? 1'b1 : 1'b0;
    assign next = (equal) ? 1'b0 : (state + 1'b1);
	 
   /*always @(posedge clk_50)
		begin
			if(!rs) clk_out <= 1'd0;
			 else if (equal) clk_out =~ clk_out;
		end*/
		
    always @(posedge clk or posedge rs) 
		begin
        if (rs)
            state <= 1'b0;	  
        else
            state <= next;         
		end
	
endmodule
