`define DELAY 20
module slt32_test(); 
	reg [31:0]a, b;
	wire [31:0]result;

	slt32 fatb (a, b,result);

	initial begin
	a=21; b=20; 
	#`DELAY;
	a=5; b=8;
	#`DELAY;
	a=300; b=15; 
	#`DELAY;
	a=45; b=-999999;
	#`DELAY;
	end
 
 
	initial
		begin
			$monitor("time = %2d, a =%d, b=%d, result =%d", $time, a, b, result);
		end
 
endmodule