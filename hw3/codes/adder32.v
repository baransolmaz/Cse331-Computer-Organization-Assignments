module adder32(in1,in2,cin,sum,cout); 
	input [31:0] in1 , in2;
	input cin;
	output [31:0] sum;
	output cout;
	wire [7:0]c;

	full_adder_4b f0(in1[3:0],in2[3:0],cin,sum[3:0],c[0]);
	full_adder_4b f1(in1[7:4],in2[7:4],c[0],sum[7:4],c[1]);
	full_adder_4b f2(in1[11:8],in2[11:8],c[1],sum[11:8],c[2]);
	full_adder_4b f3(in1[15:12],in2[15:12],c[2],sum[15:12],c[3]);
	full_adder_4b f4(in1[19:16],in2[19:16],c[3],sum[19:16],c[4]);
	full_adder_4b f5(in1[23:20],in2[23:20],c[4],sum[23:20],c[5]);
	full_adder_4b f6(in1[27:24],in2[27:24],c[5],sum[27:24],c[6]);
	full_adder_4b f7(in1[31:28],in2[31:28],c[6],sum[31:28],cout);
 
endmodule