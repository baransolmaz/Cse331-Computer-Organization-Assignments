`define DELAY 20
module sub32_test(); 
	reg [31:0]a, b;
	wire [31:0]sum;
	wire carry_out;

	sub32 fatb (a, b,sum, carry_out);

	initial begin
	a=21; b=20; 
	#`DELAY;
	a=10; b=8;
	#`DELAY;
	a=300; b=15; 
	#`DELAY;
	a=45; b=4294967260;
	#`DELAY;
	end
 
 
	initial
		begin
			$monitor("time = %2d, a =%d, b=%d, result =%d, carry_out=%1b", $time, a, b, sum, carry_out);
		end
 
endmodule