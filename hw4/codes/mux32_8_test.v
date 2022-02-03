`define DELAY 20
module mux32_8_test(); 
	reg [31:0] a,b,c,d,e,f,g,h;
	wire [31:0]sum;
	reg [2:0] op;
	
	mux32_8 fatb (a,b,c,d,e,f,g,h,op,sum);

	initial begin
		a = 8'd15; b = 8'd0;c = 8'd0; d = 8'd0;e = 8'd0; f = 8'd0;g = 8'd0; h = 8'd0; op = 3'b000;
		#`DELAY;
		a = 8'd0; b = 8'd15;c = 8'd0; d = 8'd0;e = 8'd0; f = 8'd0;g = 8'd0; h = 8'd0; op = 3'b001;
		#`DELAY;
		a = 8'd0; b = 8'd0;c = 8'd15; d = 8'd0;e = 8'd0; f = 8'd0;g = 8'd0; h = 8'd0; op = 3'b010;
		#`DELAY;
		a = 8'd0; b = 8'd0;c = 8'd0; d = 8'd15;e = 8'd0; f = 8'd0;g = 8'd0; h = 8'd0; op = 3'b011;
		#`DELAY;
		a = 8'd0; b = 8'd0;c = 8'd0; d = 8'd0;e = 8'd15; f = 8'd0;g = 8'd0; h = 8'd0; op = 3'b100;
		#`DELAY;
		a = 8'd0; b = 8'd0;c = 8'd0; d = 8'd0;e = 8'd0; f = 8'd15;g = 8'd0; h = 8'd0; op = 3'b101;
		#`DELAY;
		a = 8'd0; b = 8'd0;c = 8'd0; d = 8'd0;e = 8'd0; f = 8'd0;g = 8'd15; h = 8'd0; op = 3'b110;
		#`DELAY;
		a = 8'd0; b = 8'd0;c = 8'd0; d = 8'd0;e = 8'd0; f = 8'd0;g = 8'd0; h = 8'd15; op = 3'b111;
	end
	 
	 
	initial begin
		$monitor("time = %2d, a =%d, b=%d,c =%d, d=%d,e =%d, f=%d,g =%d, h=%d, op=%d, sum=%d", $time,a,b,c,d,e,f,g,h, op, sum);
	end
 
endmodule