`define DELAY 20
module Alu_test(); 
	reg [31:0]readData1,data2;
	reg [2:0] alu_control;
	wire [31:0]alu_res;
	wire zero;

	Alu fatb (alu_control,readData1,data2,alu_res,zero);

	initial begin
		alu_control=3'b000; 
		readData1=32'd5;
		data2=32'd5;
		#`DELAY;
		alu_control=3'b001; 
		readData1=32'd5;
		data2=32'd5;
		#`DELAY;
		alu_control=3'b010; 
		readData1=32'd5;
		data2=32'd5;
		#`DELAY;
		alu_control=3'b011; 
		readData1=32'd5;
		data2=32'd5;
		#`DELAY;
		alu_control=3'b100; 
		readData1=32'd5;
		data2=32'd5;
		#`DELAY;
		alu_control=3'b101; 
		readData1=32'd5;
		data2=32'd5;
		#`DELAY;
		alu_control=3'b110; 
		readData1=32'd5;
		data2=32'd5;
		#`DELAY;
		alu_control=3'b111; 
		readData1=32'd5;
		data2=32'd6;
		#`DELAY;
	end
 
 
	initial
		begin
			$monitor("time = %2d, alu_control=%3b , readData1 =%d, data2=%d, alu_res=%d , zero= %b", $time,alu_control,readData1, data2, alu_res,zero);
		end
 
endmodule