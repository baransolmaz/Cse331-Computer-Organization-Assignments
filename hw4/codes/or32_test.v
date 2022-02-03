`define DELAY 20
module or32_test(); 
	reg [31:0]a, b;
	wire [31:0]result;

	or32 fatb (a, b,result);

	initial begin
	a=5; b=3;
	#`DELAY;
	a=10; b=8;
	#`DELAY;
	a=300; b=15;
	#`DELAY;
	a=429400000; b=67296;
	#`DELAY;
	end
 
 
	initial
		begin
			$monitor("time = %2d, a =%d, b=%d, result =%d", $time, a, b, result);
		end
 
endmodule