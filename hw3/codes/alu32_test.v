`define DELAY 300
module alu32_test(); 
	reg [31:0]a, b;
	reg [2:0] op;
	wire [31:0]sum;
	reg clk;

	alu32 fatb (clk,a, b, op, sum);
	initial 
		begin 
			clk=1'b0;
			#10;
		end
		
	always
		begin
			#10 clk=~clk;
		end
	initial begin
	/*MULT*/
	a=10; b=8;op=3'b011;
	#6000;
	#`DELAY;
	a=20; b=25;op=3'b011;
	#6000;
	#`DELAY;
	
	/*ADD*/
	a=15; b=20 ;op=3'b000;
	#`DELAY;
	a=48; b=60 ;op=3'b000;
	#`DELAY;
	
	/*XOR*/
	a=15; b=20 ;op=3'b001;
	#`DELAY;
	a=48; b=60 ;op=3'b001;
	#`DELAY;
	
	/*SUB*/
	a=10; b=8;op=3'b010;
	#`DELAY;
	a=20; b=25;op=3'b010;
	#`DELAY;
		
	/*SLT*/
	a=300; b=15;op=3'b100;
	#`DELAY;
	a=14; b=40;op=3'b100;
	#`DELAY;
	
	/*NOR*/
	a=15; b=20 ;op=3'b101;
	#`DELAY;
	a=48; b=60 ;op=3'b101;
	#`DELAY;
	
	/*AND*/
	a=15; b=20 ;op=3'b110;
	#`DELAY;
	a=48; b=60 ;op=3'b110;
	#`DELAY;
	
	/*OR*/
	a=15; b=20 ;op=3'b111;
	#`DELAY;
	a=48; b=60 ;op=3'b111;
	#`DELAY;
	$stop;
	end
 
 
	initial
		begin
			$monitor("time = %2d, a =%d, b=%d, result =%d , OP= %3b", $time, a, b, sum,op);
		end
 
endmodule