module control_unit(instruction,regDst,branch,memRead,memToReg,AluOP,memWrite,AluSrc,regWrite);
	input [3:0] instruction;
	output regDst,branch,memRead,memToReg,memWrite,AluSrc,regWrite;
	output [2:0]AluOP;
	
	assign regDst= ~instruction[3]& ~instruction[2]&~instruction[1]& ~instruction[0] ;//   A'B'C'D'			
	assign memWrite= instruction[3]& instruction[0] ;//AD			
	assign branch= (instruction[2]& ~instruction[1]& instruction[0])
						|(instruction[2]& instruction[1]& ~instruction[0]); //BC'D + BCD'			
	assign AluSrc=  instruction[3] | (~instruction[2]& instruction[0])
						|(~instruction[2]& instruction[1])
						|(instruction[1]& instruction[0])
						|(instruction[2]& ~instruction[1]& ~instruction[0]) ;//A + B'D + B'C + CD + BC'D'			
	assign memRead= instruction[3]& ~instruction[0] ;//AD'			
	assign regWrite = ( ~instruction[3]& ~instruction[2]) 
						|(~instruction[1]& ~instruction[0])
						|( instruction[1]& instruction[0]);//A'B' + C'D' + CD		
			
	assign memToReg= instruction[3];//A
	assign AluOP[2]= instruction[2];//B			
	assign AluOP[1]= instruction[1];//C 
	assign AluOP[0]= instruction[3] 
						| (~instruction[2]& instruction[0])
						|(~instruction[1]& instruction[0])
						|(instruction[2]& instruction[1]& ~instruction[0]) ;// A + B'D + C'D + BCD'			

	
endmodule