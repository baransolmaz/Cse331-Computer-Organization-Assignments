module regN(reset,clock,d,q);
	input reset,clock;
	input [1:0] d;
	
	output [1:0] q;
	reg [1:0] q;
	
	always @(posedge clock or negedge reset)
	begin
		if(!reset)
			q=0;
		else if(clock ==1)
			q=d;
	end
endmodule