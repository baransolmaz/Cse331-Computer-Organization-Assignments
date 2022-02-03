`define DELAY 20
module mux8to1_test(); 
	reg a,b,c,d,e,f,g,h;
	wire sum;
	reg [2:0] op;
	
	mux8to1 fatb (a,b,c,d,e,f,g,h,op,sum);

	initial begin
		a = 1'b1; b = 1'b0;c = 1'b0; d = 1'b0;e = 1'b0; f = 1'b0;g = 1'b0; h = 1'b0; op = 3'b000;
		#`DELAY;
		a = 1'b0; b = 1'b1;c = 1'b0; d = 1'b0;e = 1'b0; f = 1'b0;g = 1'b0; h = 1'b0; op = 3'b001;
		#`DELAY;
		a = 1'b0; b = 1'b0;c = 1'b1; d = 1'b0;e = 1'b0; f = 1'b0;g = 1'b0; h = 1'b0; op = 3'b010;
		#`DELAY;
		a = 1'b0; b = 1'b0;c = 1'b0; d = 1'b1;e = 1'b0; f = 1'b0;g = 1'b0; h = 1'b0; op = 3'b011;
		#`DELAY;
		a = 1'b0; b = 1'b0;c = 1'b0; d = 1'b0;e = 1'b1; f = 1'b0;g = 1'b0; h = 1'b0; op = 3'b100;
		#`DELAY;
		a = 1'b0; b = 1'b0;c = 1'b0; d = 1'b0;e = 1'b0; f = 1'b1;g = 1'b0; h = 1'b0; op = 3'b101;
		#`DELAY;
		a = 1'b0; b = 1'b0;c = 1'b0; d = 1'b0;e = 1'b0; f = 1'b0;g = 1'b1; h = 1'b0; op = 3'b110;
		#`DELAY;
		a = 1'b0; b = 1'b0;c = 1'b0; d = 1'b0;e = 1'b0; f = 1'b0;g = 1'b0; h = 1'b1; op = 3'b111;
	end
	 
	 
	initial begin
		$monitor("time = %2d, a =%1b, b=%1b,c =%1b, d=%1b,e =%1b, f=%1b,g =%1b, h=%1b, op=%3b, sum=%1b", $time,a,b,c,d,e,f,g,h, op, sum);
	end
 
endmodule