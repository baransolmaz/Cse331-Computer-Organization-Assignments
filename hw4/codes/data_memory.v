module data_memory(clk,address,write_data,memWrite,memRead,read_data);
	input [31:0] address,write_data;
	input memWrite,memRead,clk;
	output reg [31:0] read_data;
	reg [31:0] data [63:0];
	
	always @(*) begin
		if(memRead) begin
			read_data<= data[address];
		end
	end
	
	always @(posedge clk) begin
		if(memWrite)begin
			data[address]<= write_data;
		end
	end

	endmodule