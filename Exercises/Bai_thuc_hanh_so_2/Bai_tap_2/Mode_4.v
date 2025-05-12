/*module Mode_4(clk, rst,out1,out2);

	input     clk,rst;
	output  wire   [3:0] out1;
	output  wire   [3:0] out2;
   wire   [3:0] reg_next1;
   reg   [3:0] reg_out1;
   wire   [3:0] reg_next2;
   reg   [3:0] reg_out2;
   reg     comp1;//compare1
   reg     comp2;//compare2
 
	assign reg_next1 = (comp1 == 1) ? (reg_out1>>1) : (comp1 == 0) ? (reg_out1<<1):reg_next1;
	always @(posedge clk or negedge rst)
		begin
			if (!rst)
				reg_out1 <= 4'b1000;
			else
				reg_out1 <= reg_next1;
		end

//assign comp1 = (reg_out1 == 4'b1000) ? 1'b1 : (reg_out1 == 4'b0001) ? 1'b0 : comp1;
always @(negedge clk or negedge rst)
begin
if (!rst)
 comp1 = 1;
 else if (reg_out1 == 4'b1000)
comp1 = 1;
   else if (reg_out1 == 4'b0001)
   comp1 = 0;
    else
    comp1 = comp1;
end
//assign out1 = reg_out1;
assign reg_next2 = (comp2 == 1) ? (reg_out2<<1) :(comp2 == 0) ? (reg_out2>>1):reg_next2;

always @(posedge clk or negedge rst)
begin
if (!rst)
   reg_out2 <= 4'b0001;
  else
   reg_out2 <= reg_next2;
end
//assign comp2 = (reg_out2 == 4'b0001) ? 1'b1 : (reg_out2 == 4'b1000) ? 1'b0 : comp2;

always @(negedge clk or negedge rst)
begin
if (!rst)
 comp2 = 1;
 else if (reg_out2 == 4'b0001)
  comp2 = 1;
   else if (reg_out2 == 4'b1000)
   comp2 = 0;
    else
    comp2 = comp2;
end
assign out2 = reg_out2;
assign out1 = reg_out1;

endmodule*/

module Mode_4 (
    input  wire       clk,
    input  wire       rst,
    output wire  [3:0] out1,
    output wire  [3:0] out2
);

    reg tt1;
    reg tt2;
	 reg [3:0] reg_out1;
	 reg [3:0] reg_out2;

 wire [3:0] reg_next1 = tt1 ? (reg_out1 >> 1) : (reg_out1 << 1);
 always @(posedge clk or negedge rst) 
	 begin
        if (!rst)
            reg_out1 <= 4'b1000;  
        else
            reg_out1 <= reg_next1;
    end
	 
 always @(negedge clk or negedge rst)
   begin
        if (!rst)
            tt1 <= 1;  
        else if (reg_out1 == 4'b1000)
            tt1 <= 1;  
        else if (reg_out1 == 4'b0001)
            tt1 <= 0;  
    end
	 assign out1 = reg_out1; 

    wire [3:0] reg_next2 = tt2 ? (reg_out2 << 1) : (reg_out2 >> 1);

    always @(posedge clk or negedge rst)
	 begin
        if (!rst)
            reg_out2 <= 4'b0001;  
        else
            reg_out2 <= reg_next2;
    end
	 always @(negedge clk or negedge rst)
	 begin
        if (!rst)
            tt2 <= 1;  
        else if (reg_out2 == 4'b0001)
            tt2 <= 1;  
        else if (reg_out2 == 4'b1000)
            tt2 <= 0;  
    end

    assign out2 = reg_out2;

endmodule