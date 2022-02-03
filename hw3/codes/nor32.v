module nor32(in1,in2,result);
	input [31:0] in1,in2;
	output [31:0] result;
	
	nor(result[0],in1[0],in2[0]);
	nor(result[1],in1[1],in2[1]);
	nor(result[2],in1[2],in2[2]);
	nor(result[3],in1[3],in2[3]);
	nor(result[4],in1[4],in2[4]);
	nor(result[5],in1[5],in2[5]);
	nor(result[6],in1[6],in2[6]);
	nor(result[7],in1[7],in2[7]);
	nor(result[8],in1[8],in2[8]);
	nor(result[9],in1[9],in2[9]);
	nor(result[10],in1[10],in2[10]);
	nor(result[11],in1[11],in2[11]);
	nor(result[12],in1[12],in2[12]);
	nor(result[13],in1[13],in2[13]);
	nor(result[14],in1[14],in2[14]);
	nor(result[15],in1[15],in2[15]);
	nor(result[16],in1[16],in2[16]);
	nor(result[17],in1[17],in2[17]);
	nor(result[18],in1[18],in2[18]);
	nor(result[19],in1[19],in2[19]);
	nor(result[20],in1[20],in2[20]);
	nor(result[21],in1[21],in2[21]);
	nor(result[22],in1[22],in2[22]);
	nor(result[23],in1[23],in2[23]);
	nor(result[24],in1[24],in2[24]);
	nor(result[25],in1[25],in2[25]);
	nor(result[26],in1[26],in2[26]);
	nor(result[27],in1[27],in2[27]);
	nor(result[28],in1[28],in2[28]);
	nor(result[29],in1[29],in2[29]);
	nor(result[30],in1[30],in2[30]);
	nor(result[31],in1[31],in2[31]);
	
endmodule