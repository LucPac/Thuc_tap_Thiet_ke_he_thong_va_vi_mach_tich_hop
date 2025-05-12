module ledhienthi
	(
    input [5:0] q,
    output x1,v1,d1,x2,v2,d2
    );
	 
	assign x1 = q[0];
	assign v1 = q[1];
	assign d1 = q[2];
	assign x2 = q[3];
	assign v2 = q[4];
	assign d2 = q[5];

endmodule
