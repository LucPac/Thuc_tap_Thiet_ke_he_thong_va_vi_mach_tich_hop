/*module Mode1(

	input button,
	output [7:0] q
	
    );
	
	reg [7:0] r_reg=0;
	wire [7:0] r_next;
	reg comp;//bien so sanh, 0: dem len, 1: dem xuong
	
	always @(negedge button)
		begin 
			if(r_reg == 0) comp=0;
			else if(r_reg == 19) comp=1;
			else comp=comp;
		end
		
	always @(negedge button)
		begin
			if(!button) r_reg <= r_next;
		end
		
	assign r_next = (comp==0)?(r_reg+1) : ((comp==1)?(r_reg-1) : r_next);
	assign q = r_reg;
		

endmodule*/


module Mode1(
input wire reset,clk,btn,
output wire [7:0] q
);
wire tick;
button btn1(reset, clk,btn,tick);
Counter8bs counter(tick, reset,q);
endmodule
////////////////////////////////////////////////////////////////////////////
module button(
input wire reset,clk,btn,
output reg db
);
localparam [2:0]
zero = 3'b000,
wait1_1 = 3'b001,
wait1_2 = 3'b010,
wait1_3= 3'b011,
one = 3'b100,
wait0_1= 3'b101,
wait0_2 = 3'b110,
wait0_3 = 3'b111;
localparam N = 13;
//signal declaration
reg [N-1:0] q_reg;
wire [N-1:0] q_next;
wire m_tick;
reg [2:0] state_reg, state_next;
// counter to generate 10ms tick
always @(posedge clk)
q_reg <=q_next;
// next state logic
assign q_next = q_reg +1 ;
// output tick
assign m_tick = (q_reg==0)?1'b1:1'b0;
//debouncing FSM
//state register
always @(posedge clk, posedge reset)
if(reset)
state_reg <= zero;
else
state_reg<= state_next;
// next state logic and output logic
always @*
begin state_next = state_reg;// default state
db = 1'b0;
case (state_reg)
zero:
if(btn)
state_next = wait1_1;
wait1_1:
if (~btn)
state_next = zero;
else
if (m_tick)
state_next = wait1_2;
wait1_2:
if (~btn)
state_next = zero;
else
if (m_tick)
state_next = wait1_3;
wait1_3:
if (~btn)
state_next = zero;
else
if (m_tick)
state_next = one;
one:
begin
db = 1'b1;
if(~btn)
state_next = wait0_1;
end
wait0_1:
begin
db = 1'b1;
if (btn)
state_next = one;
else
if (m_tick)
state_next = wait0_2;
end
wait0_2:
begin
db = 1'b1;
if (btn)
state_next = one;
else
if (m_tick)
state_next = wait0_3;
end
wait0_3:
begin
db = 1'b1;
if(btn)
state_next = one;
else
if (m_tick)
state_next = zero;
end
default: state_next = zero;
endcase
end
endmodule
/////////////////////////////////////////////////////////
module Counter8bs
#(parameter N= 8) // 500,000,000 for 0.1Hz
( input wire clk,reset,
output wire [7:0]q
);
// signal declaration
	reg [7:0] r_reg=0;
	wire [7:0] r_next;
	reg comp;//bien so sanh, 0: dem len, 1: dem xuong
	
	always @(posedge clk)
		begin 
			if(r_reg == 0) comp=0;
			else if(r_reg == 18) comp=1;
			else comp=comp;
		end
		
	always @(posedge clk)
		begin
			r_reg <= r_next;
		end
		
	assign r_next = (comp==0)?(r_reg+1) : ((comp==1)?(r_reg-1) : r_next);
	assign q = r_reg;
endmodule
