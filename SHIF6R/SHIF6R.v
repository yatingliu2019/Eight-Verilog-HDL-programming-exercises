module SHIF6R(clk,din,dout);
	input [5:0] din;
	input clk;
	output dout;
	wire dout;
	reg [5:0] qtemp;
	(* synthesis,keep *) wire en;
	reg [2:0] temp;
	always@(posedge clk )
		begin
			if(en == 1)qtemp <= din; 
				
			else qtemp <= {qtemp[0],qtemp[5:1]};		
		end
		assign en=(temp==5)? 1:0;
		assign dout = qtemp[0];
		
		always@(posedge clk)
		begin
		if(temp<5)temp <=temp+1;
		else temp<=0;
		end
endmodule