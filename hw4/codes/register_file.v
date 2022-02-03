module register_file (clk, read_reg1, read_reg2, write_reg, write_data, reg_write, read_data1, read_data2);

	input clk;
	input [2:0]read_reg1, read_reg2,write_reg;
	input reg_write;
	input [31:0] write_data;
	output reg [31:0] read_data1, read_data2;
	reg [31:0] data [7:0];
	always @(*) 
		begin
			read_data1 <= data[read_reg1];
			read_data2 <= data[read_reg2];
		end

	always @(posedge clk)
		begin
			if (reg_write ) begin
				data[write_reg] <= write_data;
			end
		end
endmodule