`define DELAY 20
module MiniMips_test();
	reg [31:0] counter;
	reg clk;
	wire [31:0] result,nextCounter;
	
	MiniMips fatb(clk,counter,result,nextCounter);
	initial begin
		$readmemb("instructions.mem",fatb.f0.data);
		$readmemb("memmory.mem",fatb.f9.data);
		$readmemb("in_reg.mem",fatb.f4.data);
		clk=1;counter=0;
	end
	
	always begin 
		#20 clk= ~clk;
	end	
	
	always @(negedge clk)begin
		$display("time = %2d, counter=%d,instruction=%16b,in1=%d,in2=%d, result= %d, nextCounter=%d", $time,counter,fatb.instruction,fatb.read_data1,fatb.data2,result,nextCounter);
		if(nextCounter>6'b111111)
			begin
				#20;
				$writememb("out_memmory.mem",fatb.f9.data);
				$writememb("out_reg.mem",fatb.f4.data);
				$stop;
			end
		#40;
		counter<= nextCounter;
	end


endmodule