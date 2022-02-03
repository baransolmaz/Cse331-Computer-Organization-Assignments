module sub32(in1,in2,sum,cout); 
	input [31:0] in1 , in2;
	output [31:0] sum;
	output cout;
	wire [31:0] result;
	
	not(result[0],in2[0]);
	not(result[1],in2[1]);
	not(result[2],in2[2]);
	not(result[3],in2[3]);
	not(result[4],in2[4]);
	not(result[5],in2[5]);
	not(result[6],in2[6]);
	not(result[7],in2[7]);
	not(result[8],in2[8]);
	not(result[9],in2[9]);
	not(result[10],in2[10]);
	not(result[11],in2[11]);
	not(result[12],in2[12]);
	not(result[13],in2[13]);
	not(result[14],in2[14]);
	not(result[15],in2[15]);
	not(result[16],in2[16]);
	not(result[17],in2[17]);
	not(result[18],in2[18]);
	not(result[19],in2[19]);
	not(result[20],in2[20]);
	not(result[21],in2[21]);
	not(result[22],in2[22]);
	not(result[23],in2[23]);
	not(result[24],in2[24]);
	not(result[25],in2[25]);
	not(result[26],in2[26]);
	not(result[27],in2[27]);
	not(result[28],in2[28]);
	not(result[29],in2[29]);
	not(result[30],in2[30]);
	not(result[31],in2[31]);
	
	adder32 fatb (in1,result,1'b1,sum, cout);
	
endmodule