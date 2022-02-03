`define DELAY 20
module adder32_test(); 
	reg [31:0]a, b;
	reg carry_in;
	wire [31:0]sum;
	wire carry_out;

	adder32 fatb (a, b, carry_in,sum, carry_out);

	initial begin
	a=15; b=20; carry_in=0;
	#`DELAY;
	a=10; b=8; carry_in=1;
	#`DELAY;
	a=300; b=15; carry_in=1;
	#`DELAY;
	a=4294900000; b=67296; carry_in=1;
	#`DELAY;
	end
 
 
	initial
		begin
			$monitor("time = %2d, a =%d, b=%d, carry_in=%1b, sum =%d, carry_out=%1b", $time, a, b, carry_in, sum, carry_out);
		end
 
endmodule