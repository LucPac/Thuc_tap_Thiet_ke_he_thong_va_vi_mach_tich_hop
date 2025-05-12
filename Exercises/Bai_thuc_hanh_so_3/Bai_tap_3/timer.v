/*module timer
	(
	output TS,//timeshort
	output TL,//timelong
	input ST,//reset bien dem ve 0 khi dat gia tri dem
	input Clk
	);
	
	integer value;
	
	assign TS  = (value>=3);
	assign TL  = (value>=27);
	
	always@(posedge ST or posedge Clk)
		begin
			if(ST==1)
				begin
					value=0;
				end
			else 
				begin
					value=value+1;
				end
		end
		
endmodule*/

module timer
	(
	output TS1,//timeshort
	output TL1,//timelong
	output TS2,//timeshort
	output TL2,//timelong
	input ST,//reset bien dem ve 0 khi dat gia tri dem
	input Clk
	);
	
	integer value;
	
	assign TS1  = (value>=3);
	assign TL1  = (value>=27);
	
	assign TS2  = (value>=3);
	assign TL2  = (value>=17);
	
	always@(posedge ST or posedge Clk)
		begin
			if(ST==1)
				begin
					value=0;
				end
			else 
				begin
					value=value+1;
				end
		end
		
endmodule

