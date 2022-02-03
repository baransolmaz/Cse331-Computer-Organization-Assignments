`define DELAY 20
module adder_4b_test(); 
	reg [3:0]a, b;
	reg carry_in;
	wire [3:0]sum;
	wire carry_out;

	full_adder_4b fatb (a, b, carry_in,sum, carry_out);

	initial begin
	a = 4'b0000; b = 4'b0000; carry_in = 1'b0;
	#`DELAY;
	a = 4'b0010; b = 4'b0000; carry_in = 1'b1;	
	#`DELAY;
	a = 4'b0110; b = 4'b0001; carry_in = 1'b1;
	#`DELAY;
	a = 4'b1000; b = 4'b0111; carry_in = 1'b1;
	end
 
 
	initial
		begin
			$monitor("time = %2d, a =%4b, b=%4b, carry_in=%1b, sum =%4b, carry_out=%1b", $time, a, b, carry_in, sum, carry_out);
		end
 
endmodule