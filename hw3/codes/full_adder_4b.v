module full_adder_4b(in1,in2,cin,sum,cout); 
	input [3:0] in1 , in2;
	input cin;
	output [3:0] sum;
	output cout;
	wire c1,c2,c3;

	full_adder f0(in1[0],in2[0],cin,sum[0],c1);
	full_adder f1(in1[1],in2[1],c1,sum[1],c2);
	full_adder f2(in1[2],in2[2],c2,sum[2],c3);
	full_adder f3(in1[3],in2[3],c3,sum[3],cout);
 

endmodule