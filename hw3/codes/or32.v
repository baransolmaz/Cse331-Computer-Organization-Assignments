module or32(in1,in2,result);
	input [31:0] in1,in2;
	output [31:0] result;
	
	or(result[0],in1[0],in2[0]);
	or(result[1],in1[1],in2[1]);
	or(result[2],in1[2],in2[2]);
	or(result[3],in1[3],in2[3]);
	or(result[4],in1[4],in2[4]);
	or(result[5],in1[5],in2[5]);
	or(result[6],in1[6],in2[6]);
	or(result[7],in1[7],in2[7]);
	or(result[8],in1[8],in2[8]);
	or(result[9],in1[9],in2[9]);
	or(result[10],in1[10],in2[10]);
	or(result[11],in1[11],in2[11]);
	or(result[12],in1[12],in2[12]);
	or(result[13],in1[13],in2[13]);
	or(result[14],in1[14],in2[14]);
	or(result[15],in1[15],in2[15]);
	or(result[16],in1[16],in2[16]);
	or(result[17],in1[17],in2[17]);
	or(result[18],in1[18],in2[18]);
	or(result[19],in1[19],in2[19]);
	or(result[20],in1[20],in2[20]);
	or(result[21],in1[21],in2[21]);
	or(result[22],in1[22],in2[22]);
	or(result[23],in1[23],in2[23]);
	or(result[24],in1[24],in2[24]);
	or(result[25],in1[25],in2[25]);
	or(result[26],in1[26],in2[26]);
	or(result[27],in1[27],in2[27]);
	or(result[28],in1[28],in2[28]);
	or(result[29],in1[29],in2[29]);
	or(result[30],in1[30],in2[30]);
	or(result[31],in1[31],in2[31]);
	
endmodule