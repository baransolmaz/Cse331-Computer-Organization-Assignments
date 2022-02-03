module Alu(alu_control,readData1,data2,alu_res,zero);
	input[2:0] alu_control;
	input [31:0] readData1,data2;
	output zero;
	output [31:0] alu_res;
	wire [31:0] and1,add1,sub1,xor1,nor1,or1,slt1;
	wire cout1,cout2,bne,tmpzero,nottmpzero;
	
	and32 f0(readData1,data2,and1);
	adder32 f1(readData1,data2,1'b0,add1,cout1);
	sub32 f2(readData1,data2,sub1,cout2); 
	xor32 f3(readData1,data2,xor1);
	nor32 f4(readData1,data2,nor1);
	or32 f5(readData1,data2,or1);
	slt32 f6(readData1,data2,slt1);
	
	mux32_8 f7(and1,add1,sub1,xor1,nor1,or1,slt1,sub1,alu_control, alu_res);
	
	or(tmpzero,alu_res[0],alu_res[1],alu_res[2],alu_res[3],alu_res[4],alu_res[5],alu_res[6],alu_res[7],alu_res[8],
		alu_res[9],alu_res[10],alu_res[11],alu_res[12],alu_res[13],alu_res[14],alu_res[15],alu_res[16],alu_res[17],
		alu_res[18],alu_res[19],alu_res[20],alu_res[21],alu_res[22],alu_res[23],alu_res[24],alu_res[25],alu_res[26],
		alu_res[27],alu_res[28],alu_res[29],alu_res[30],alu_res[31]);
	
	not(nottmpzero,tmpzero);
	mux2to1 f8(nottmpzero,tmpzero,alu_control[0],zero);
	

endmodule