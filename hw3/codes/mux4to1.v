module mux4to1(in1, in2,in3, in4, s1,s0, result);
	input in1, in2,in3, in4, s0, s1;
	output result;
	wire w1,w2,w3;
	
	mux2to1 m1(in1,in2,s0,w1);
	mux2to1 m2(in3,in4,s0,w2);
	mux2to1 m3(w1,w2,s1,result);
	
endmodule