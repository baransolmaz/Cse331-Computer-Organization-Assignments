`define DELAY 20
module control_unit_test(); 
	wire regDst,branch,memRead,memToReg,memWrite,AluSrc,regWrite;
	reg [3:0]instruction;
	wire [2:0] AluOP;

	control_unit fatb (instruction,regDst,branch,memRead,memToReg,AluOP,memWrite,AluSrc,regWrite);
	

	initial
		begin
			instruction=4'b0000;
			#`DELAY;
			instruction=4'b0001;
			#`DELAY;
			instruction=4'b0010;
			#`DELAY;
			instruction=4'b0011;
			#`DELAY;
			instruction=4'b0100;
			#`DELAY;
			instruction=4'b0101;
			#`DELAY;
			instruction=4'b0110;
			#`DELAY;
			instruction=4'b0111;
			#`DELAY;
			instruction=4'b1000;
			#`DELAY;
			instruction=4'b1001;
			#`DELAY;
			$stop;
		end
 
	initial
		begin
			$monitor("time = %2d, instruction=%4b,regDst=%d,branch=%d,memRead=%d,memToReg=%d,AluOP=%3b,memWrite=%d,AluSrc=%2b,regWrite=%d", $time, instruction,regDst,branch,memRead,memToReg,AluOP,memWrite,AluSrc,regWrite);
		end
 
endmodule