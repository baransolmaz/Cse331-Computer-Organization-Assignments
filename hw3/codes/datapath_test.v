`define DELAY 20
module datapath_test();
	reg [31:0] mult;
	reg [63:0] inP;
	reg write;
	wire [63:0] outP;
	 
	datapath d1(mult,inP,write,outP);


	initial
		begin
			#`DELAY mult=32'd12;inP={32'd0,32'd8};
			#`DELAY write=0;
			#`DELAY inP=outP;
			#`DELAY write=0;
			#`DELAY inP=outP;
			#`DELAY write=0;
			#`DELAY inP=outP;
			#`DELAY write=1;
			#`DELAY inP=outP;
			#`DELAY write=0;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
			#`DELAY inP=outP;
		end
	initial 
		begin
			$monitor("time:%2d, mult=%d ,P1=%2d ,Result=%2d,write=%1b",$time,mult,inP[63:32],outP[31:0],write);
		end	
endmodule