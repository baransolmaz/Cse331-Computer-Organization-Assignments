module instruction_memory(clk,address,instruction);
	input [31:0] address;
	input clk;
	output reg [15:0] instruction;
	reg [15:0] data [63:0];
	
	
	always @(posedge clk) begin
		instruction<= data[address];
	end

	endmodule