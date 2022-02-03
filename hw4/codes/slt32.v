module slt32(in1,in2,result);
	input [31:0] in1,in2;
	output [31:0] result;
	wire [31:0] w;
	wire cout,cout1;
	
	sub32 f(in1,in2,w,cout);
	/*if in1 > in2 , result is 0 otherwise 1 */
	adder32 f1(32'd0,{31'd0,w[31]},1'b0,result,cout1);

endmodule