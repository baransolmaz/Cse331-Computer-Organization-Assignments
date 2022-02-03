`define DELAY 20
module sign_extend_test(); 
	reg [5:0]a;
	wire [31:0]result;

	sign_extend fatb (a,result);

	initial begin
	a=6'b000101;
	#`DELAY;
	a=6'b001010;
	#`DELAY;
	a=6'b110010;
	#`DELAY;

	end
 
 
	initial
		begin
			$monitor("time = %2d, a =%32b, result =%32b", $time, a, result);
		end
 
endmodule