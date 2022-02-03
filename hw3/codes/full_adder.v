module full_adder(in1,in2,cin,sum,cout);
	input in1,in2,cin;
	output sum,cout;
	wire s1,c1,c2,c3;

	xor(s1,in1,in2);
	xor(sum,cin,s1);
	and(c1,in1,in2);
	and(c2,in2,cin);
	and(c3,in1,cin);
	or(cout,c1,c2,c3);
endmodule