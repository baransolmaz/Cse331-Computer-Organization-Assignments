module xor32 (in1,in2,result);
	input [31:0] in1 , in2;
	output [31:0] result;


	xor(result[0],in1[0],in2[0]);
	xor(result[1],in1[1],in2[1]);
	xor(result[2],in1[2],in2[2]);
	xor(result[3],in1[3],in2[3]);
	xor(result[4],in1[4],in2[4]);
	xor(result[5],in1[5],in2[5]);
	xor(result[6],in1[6],in2[6]);
	xor(result[7],in1[7],in2[7]);
	xor(result[8],in1[8],in2[8]);
	xor(result[9],in1[9],in2[9]);
	xor(result[10],in1[10],in2[10]);
	xor(result[11],in1[11],in2[11]);
	xor(result[12],in1[12],in2[12]);
	xor(result[13],in1[13],in2[13]);
	xor(result[14],in1[14],in2[14]);
	xor(result[15],in1[15],in2[15]);
	xor(result[16],in1[16],in2[16]);
	xor(result[17],in1[17],in2[17]);
	xor(result[18],in1[18],in2[18]);
	xor(result[19],in1[19],in2[19]);
	xor(result[20],in1[20],in2[20]);
	xor(result[21],in1[21],in2[21]);
	xor(result[22],in1[22],in2[22]);
	xor(result[23],in1[23],in2[23]);
	xor(result[24],in1[24],in2[24]);
	xor(result[25],in1[25],in2[25]);
	xor(result[26],in1[26],in2[26]);
	xor(result[27],in1[27],in2[27]);
	xor(result[28],in1[28],in2[28]);
	xor(result[29],in1[29],in2[29]);
	xor(result[30],in1[30],in2[30]);
	xor(result[31],in1[31],in2[31]);
 

endmodule