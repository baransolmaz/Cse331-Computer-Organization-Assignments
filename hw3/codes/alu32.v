module alu32(clk,in1,in2,AluOP,result);
	input [31:0] in1,in2;
	input [2:0] AluOP;
	input clk;
	output [31:0] result;
	wire[31:0] add,sub,or1,nor1,xor1,and1,slt,mult;
	wire cin,cout;
	
	adder32 f1(in1,in2,1'b0,add,cout);
	xor32 f2 (in1, in2,xor1);
	sub32 f3 (in1, in2,sub, cout);
	mult32 f4 (clk,in1,in2,mult);
	slt32 f5 (in1, in2,slt);
	nor32 f6 (in1, in2,nor1);
	and32 f7 (in1, in2,and1);
	or32 f8 (in1, in2,or1);

	mux32 f9 (add,xor1,sub,mult,slt,nor1,and1,or1,AluOP,result);
endmodule
