module HexBcd(
 input [7:0] hex,
 output wire [3:0] ones1,ones2,
 output wire [3:0] tens1,tens2,
 output wire [3:0] hundreds1,hundreds2
    );
wire [3:0] c1,c2,c3,c4,c5,c6,c7;
wire [3:0] d1,d2,d3,d4,d5,d6,d7;
assign d1 = {1'b0,hex[7:5]};
assign d2 = {c1[2:0],hex[4]};
assign d3 = {c2[2:0],hex[3]};
assign d4 = {c3[2:0],hex[2]};
assign d5 = {c4[2:0],hex[1]};
assign d6 = {1'b0,c1[3],c2[3],c3[3]};
assign d7 = {c6[2:0],c4[3]};
add3 m1(d1,c1);
add3 m2(d2,c2);
add3 m3(d3,c3);
add3 m4(d4,c4);
add3 m5(d5,c5);
add3 m6(d6,c6);
add3 m7(d7,c7);
assign ones = {c5[2:0],hex[0]};
assign tens = {c7[2:0],c5[3]};
assign hundreds = {c6[3],c7[3]};

endmodule