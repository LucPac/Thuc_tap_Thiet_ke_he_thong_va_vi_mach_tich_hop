module Moore(
    input clk,           // Clock
    input reset,         // Reset
    input Sin,        // Input 
    output reg out  // Output: 1 khi nhan du chuoi 1001
);
    // Khai bao trang thai
    parameter IDle = 4'b0000; // Chua nhan duoc gi
    parameter D1 = 4'b0001; // Da nhan duoc 1
    parameter D10 = 4'b0010; // Da nhan duoc 10
    parameter D100 = 4'b0100; // Da nhan duoc  100
    parameter D1001 = 4'b1001; // Da nhan duoc  1001

    reg [3:0] current_state, next_state;

    // Logic trang thai tiep theo
    always @(Sin, current_state) 
		 begin
			  case (current_state)
					IDle: next_state = (Sin) ? D1 : IDle;
					D1: 	next_state = (Sin) ? D1 : D10;
					D10: 	next_state = (Sin) ? D1 : D100;
					D100: next_state = (Sin) ? D1001 : IDle;
					D1001: next_state = (Sin) ? D1 : D10;
					default: next_state = IDle;
			  endcase
		 end
    // Logic trang thai hien tai
    always @(posedge clk or posedge reset) 
		 begin
			  if (reset)
					current_state <= 0;
			  else
					current_state <= next_state;
		 end

    // Logic phat hien chuoi
    always @(current_state)
		 begin
				case (current_state)
				IDle: out = 0;
				D1: out = 0;
				D10: out =0;
				D100: out=0;
				D1001: out=1;
				default out =0;
				endcase
		 end
endmodule
