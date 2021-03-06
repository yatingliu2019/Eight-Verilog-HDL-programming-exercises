module SHIF6L(clk,din,dout);
	input clk;
	input din;
	output [5:0] dout;
	reg [5:0] dout;
	reg [5:0] qtemp;
	reg [2:0] temp;

	always@(posedge clk)
		begin
			if(temp<=5)
				begin
					qtemp <= {qtemp[4:0],din};
					temp <=temp+1;
				end
			else if(temp>5)  temp<=0;		
		end
	always@(temp)	
		begin
			if(temp>5) 
				dout<=qtemp;
		end
endmodule