`define DELAY 20
module instruction_memory_test();
	reg [31:0] address;
	reg clk;
	wire [15:0] instruction;
	
	instruction_memory fatb(clk,address,instruction);
	initial begin
		clk=1;address=0;
		$readmemb("instructions.mem",fatb.data);
	end
	
	always begin 
		#10 clk= ~clk;
	end


	initial
		begin
		#`DELAY;
			address=32'd1;
			#`DELAY;
			address=32'd2;
			#`DELAY;
			address=32'd3;
			#`DELAY;
			address=32'd3;
			#`DELAY;
			address=32'd4;
			#`DELAY;
			$stop;
		end
 
	initial
		begin
			$monitor("time = %2d, instruction=%16b", $time, instruction);
		end
 

	endmodule