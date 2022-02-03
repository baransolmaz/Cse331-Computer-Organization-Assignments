module datapath(mult,inP,write,outP);
	input [31:0] mult;
	input [63:0] inP;
	input write;
	output [63:0] outP;
	wire cout;
	wire [31:0] sum,res;
	
	mux32 m(32'd0,mult[31:0],32'd0,32'd0,32'd0,32'd0,32'd0,32'd0,{2'd0,write},res);
	
	adder32 a(inP[63:32],res[31:0],1'b0,sum,cout);
	
	assign outP[30:0]=inP[31:1];
	assign outP[63:31]={1'b0,sum[31:0]};
		
endmodule