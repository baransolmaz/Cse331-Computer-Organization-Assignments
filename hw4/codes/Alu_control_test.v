`define DELAY 20
module Alu_control_test(); 
	reg [2:0] AluOP,func;
	wire [2:0] out;
	Alu_control fatb (AluOP,func,out);
	
	initial
		begin
			AluOP=3'b000;func=3'b000;
			#`DELAY;
			AluOP=3'b000;func=3'b011;
			#`DELAY;
			AluOP=3'b000;func=3'b101;
			#`DELAY;
			AluOP=3'b001;func=3'b001;
			#`DELAY;
			AluOP=3'b001;func=3'b000;
			#`DELAY;
			AluOP=3'b101;func=3'b001;
			#`DELAY;
			AluOP=3'b111;func=3'b010;
			#`DELAY;
			AluOP=3'b101;func=3'b111;
			#`DELAY;

		end
 
	initial
		begin
			$monitor("time = %2d, AluOP=%3b,func=%d,out=%3b", $time, AluOP,func,out);
		end
 
endmodule