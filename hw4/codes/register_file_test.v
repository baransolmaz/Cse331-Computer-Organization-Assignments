`define DELAY 20
module register_file_test(); 
	reg clk;
	reg [2:0]read_reg1, read_reg2,write_reg;
	reg reg_write;
	reg [31:0] write_data;
	wire [31:0] read_data1, read_data2;

	register_file fatb (clk, read_reg1, read_reg2, write_reg, write_data, reg_write, read_data1, read_data2);
	
	initial begin
		clk= 0;
		reg_write=1'b0;
		$readmemb("in_reg.mem",fatb.data);
	end
	always begin 
		#`DELAY clk= ~clk;
	end
	initial
		begin
			read_reg1=3'd1; read_reg2=3'd2;
			#`DELAY;
			reg_write=1'b1; write_data=32'd123;write_reg=3'b101;
			#`DELAY;
			$writememb("out_reg.mem",fatb.data);
			$stop;
		end
 
	initial
		begin
			$monitor("time = %2d, read_data1 =%d, read_data2=%d", $time, read_data1, read_data2);
		end
 
endmodule