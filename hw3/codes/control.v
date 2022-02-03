module control(clk,rst,in,endi,write,endo);
	input clk,rst,in,endi;
	output write,endo;
	
	reg [1:0] present;
	wire [1:0] next;	

	assign next[0] = (~present[1]& ~present[0] & in)
						  |(present[1]& ~present[0] & endi);

	assign next[1] = (~present[1] & ~in)
						  |(~present[1]& present[0])
						  |(present[1]& ~present[0]& endi);				
			
	assign write =  (~present[1]& present[0]);
	assign endo =  (present[1]& present[0])
						|endi;
	
	always @(posedge clk or posedge rst)
		begin
			if(rst)
				present<=2'b00;
			else
				present <= next;
		end

endmodule