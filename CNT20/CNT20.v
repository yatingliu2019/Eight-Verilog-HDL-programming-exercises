module CNT20(CLK,RST,EN,LOAD,COUNT,DOUT,DATA);
	input CLK,EN,RST,LOAD;
	input [3:0] DATA;
	output [3:0] DOUT;
	output COUNT;
	reg[3:0] Q1;reg COUNT;
	assign COUNT=Q1;
	always @(posedge CLK or negedge RST)
		begin
		if(!RST) Q1<=0;
		else if(EN) begin
			if(!LOAD) Q1<=DATA;
		else if(Q1<9) Q1<=Q1+1;
		else Q1<=4'b0000;end
		end
	always@(Q1)
		if(Q1==4'h9) COUNT=1'b1;else COUNT =1'b0;
endmodule
	