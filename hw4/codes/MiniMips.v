module MiniMips(clk,counter,result,nextCounter);
	input [31:0] counter;
	input clk;
	output [31:0] result,nextCounter;
	wire [15:0] instruction;
	wire [31:0] extended,writeReg,read_data1, read_data2,data2,alu_res,read_data,write_data,addRes,newCounter;
	wire cout,cout1,regDst,branch,memRead,memToReg,memWrite,AluSrc,regWrite,zero,andRes;
	wire [2:0] AluOP,AluOut;
	
	instruction_memory f0(clk,counter,instruction);
	
	sign_extend f1(instruction[5:0],extended);
	
	control_unit f2(instruction[15:12],regDst,branch,memRead,memToReg,AluOP,memWrite,AluSrc,regWrite);
	
	mux32_8 f3({29'd0,instruction[8:6]},{29'd0,instruction[5:3]},32'd0,32'd0,32'd0,32'd0,32'd0,32'd0,{2'd0,regDst},writeReg);
	
	register_file f4(clk, instruction[11:9], instruction[8:6], writeReg[2:0], write_data, regWrite, read_data1, read_data2);
	
	mux32_8 f5(read_data2,extended,32'd0,32'd0,32'd0,32'd0,32'd0,32'd0,{2'd0,AluSrc},data2);
	
	Alu_control f6(AluOP,instruction[2:0],AluOut);
	Alu f7(AluOut,read_data1,data2,alu_res,zero);
	
	adder32 f(counter,32'd1,1'b0,newCounter,cout);
	
	adder32 f8(newCounter,{extended[29:0],2'b00},1'b0,addRes,cout1);
	and f81(andRes,branch,zero);
		
	mux32_8 f82(newCounter,addRes,32'd0,32'd0,32'd0,32'd0,32'd0,32'd0,{2'd0,andRes},nextCounter);
	
	data_memory f9(clk,alu_res,read_data2,memWrite,memRead,read_data);
	
	assign result= alu_res;
	mux32_8 f10(alu_res,read_data,32'd0,32'd0,32'd0,32'd0,32'd0,32'd0,{2'd0,memToReg},write_data);
	
	
endmodule