module Alu_control(aluOP,func,out);
	input [2:0] func;
	input [2:0]aluOP;
	output [2:0]out;
	
	assign out[2]= (aluOP[1]& aluOP[0])
						|(aluOP[2]& ~aluOP[0])
						|(~aluOP[1]&~aluOP[0]& func[2]);//BC + AC' + B'C'D	
	assign out[1]= (aluOP[2]&aluOP[0])
						|(aluOP[2]& aluOP[1])
						|(~aluOP[2]& ~aluOP[1]&~aluOP[0]& func[1]);//AC + AB + A'B'C'E
	assign out[0]= (~aluOP[2]& aluOP[0])
						|(aluOP[1]& aluOP[0])
						|(~aluOP[2]&~aluOP[1]& func[0]);//A'C + BC + A'B'F
			

endmodule