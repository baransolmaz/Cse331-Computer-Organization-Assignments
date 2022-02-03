module mult32(clk,in1,in2,result);
	input [31:0] in1,in2;
	input clk;
	output reg [31:0] result;
	reg [63:0] productI;
	wire [63:0] productO;
	reg rst,prod;
	wire writeO,endO;
	reg [33:0] counter;
	
	control fatb (clk,rst,prod,counter[0],writeO,endO);
	datapath d1(in1,productI,prod,productO);
	initial 
		begin
			#20 counter<={1'b1,33'd0}; rst<=0;
			#20 productI<={32'd0,in2};
			#20 prod<=productI[0];
		end
	initial 
		begin
			#20 rst<=1;
			#20 rst<=0;
			#20 productI<={32'd0,in2};
			#20 prod<=productI[0];
		end
		
	always @(posedge clk or posedge endO)
		begin
			if(endO)
				begin
					#20 result[31:0] <= productI[31:0];
					#20 counter<={1'b1,33'd0}; rst<=0;
					#20 productI<={32'd0,in2};
					#20 prod<=productI[0];
					#20 rst<=1;
					#20 rst<=0;
					#20 productI<={32'd0,in2};
					#20 prod<=productI[0];
					#20 counter<={2'd1,32'd0};
				end 
			else 
				begin
					#20 productI<=productO;
					#20 prod<=productI[0];
					#20 counter <={1'b0,counter[33:1]};
					#80;
				end
		end
					
endmodule