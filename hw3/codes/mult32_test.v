`define DELAY 20
module mult32_test(); 
	reg [31:0] a, b;
	wire [31:0] res;
	reg clk;
	mult32 fatb (clk,a, b,res);

	initial 
		begin 
			clk=1'b0;
			#20;
			a=32'd15; b=32'd20;
		end
		
	always
		begin
			#20 clk=~clk;
		end
		
	initial
		begin
			#20;
			a=32'd18; b=32'd5;
			#5400;
			a=32'd45; b=32'd12;
			#5400;
			$stop;
		end

 
	initial
		begin
			$monitor("time = %2d,a =%d, b =%d, result =%d ", $time, a, b, res);
		end
 
endmodule