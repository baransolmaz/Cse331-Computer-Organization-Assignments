module sign_extend(in,out);
	input [5:0] in;
	output [31:0] out;
	
	mux32_8 mux({26'd0,in},{26'b11111111111111111111111111,in},32'd0,32'd0,32'd0,32'd0,32'd0,32'd0,{2'd0,in[5]},out);

endmodule