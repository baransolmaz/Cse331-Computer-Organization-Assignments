`define DELAY 20
module control_test(); 
	reg clk,rst,in,endi;
	wire write,endo;

	control fatb (clk,rst,in,endi,write,endo);

	initial 
		begin
			clk=0;
			rst=0;
			endi=0;
		end	
	
	always
		begin
			#`DELAY	clk= ~clk;
		end
 
	initial 
		begin
			#`DELAY rst=1;
			#`DELAY rst=0; in=0; 
			#`DELAY in=1;
			#`DELAY endi=1; 	
			#`DELAY $stop;
		end
		
	initial 
		begin
			$monitor("time:%2d, rst=%1b in=%1b , endi:%b, write=%1b, endo=%1b present:%2b , next:%2b",$time,rst,in,endi,write,endo,fatb.present,fatb.next);
		end
 
endmodule