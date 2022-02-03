`define DELAY 20
module nor32_test(); 
	reg [31:0]a, b;
	wire [31:0]result;

	nor32 fatb (a, b,result);

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
			$monitor("time = %2d, a =%32b, b=%32b,\n result =%32b", $time, a, b, result);
		end
 
endmodule