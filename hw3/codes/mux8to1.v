module mux8to1(in1, in2,in3, in4,in5,in6,in7,in8,op, result);
	input in1, in2,in3, in4,in5,in6,in7,in8;
	input [2:0] op;
	output result;
	wire w1,w2,w3;
	
	mux4to1 m1(in1,in2,in3,in4,op[1],op[0],w1);
	mux4to1 m2(in5,in6,in7,in8,op[1],op[0],w2);
	mux2to1 m3(w1,w2,op[2],result);
	
endmodule