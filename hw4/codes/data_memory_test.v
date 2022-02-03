`define DELAY 20
module data_memory_test(); 
	reg clk;
	reg [31:0] address,write_data;
	reg memWrite,memRead;
	wire [31:0] read_data;

	data_memory fatb (clk,address,write_data,memWrite,memRead,read_data);
	
	initial begin
		clk= 0;
		memWrite=1'b0;
		memRead=1'b0;
		$readmemb("memmory.mem",fatb.data);
	end
	always begin 
		#10 clk= ~clk;
	end
	initial
		begin
			memWrite=1'd1; address=32'd2;write_data=32'd123;
			#`DELAY;
			memWrite=1'b0; memRead=1'b1;
			#`DELAY;
			$writememb("out_memmory.mem",fatb.data);
			$stop;
		end
 
	initial
		begin
			$monitor("time = %2d, adres=%d, write_data=%d,memWrite=%d,memRead=%d, read_data=%d", $time, address,write_data,memWrite,memRead,read_data);
		end
 
endmodule