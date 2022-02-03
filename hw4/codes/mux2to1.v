module mux2to1(in1, in2, s0, result);
	input in1, in2, s0;
	output result;
	wire w1,w2,w3;
	
	and(w1, in2, s0);
	not(w2, s0);
	and(w3, w2, in1);
	or(result, w1, w3);
	
endmodule