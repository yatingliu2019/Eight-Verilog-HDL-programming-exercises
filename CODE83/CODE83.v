module CODE83(DIN,DOUT);
	input [7:0] DIN;
	output reg [2:0] DOUT;
	always@(DIN)
		begin
			if(DIN[7]==0) begin DOUT=3'b000; end
		else if(DIN[6]==0) begin DOUT=3'b001; end
		else if(DIN[5]==0) begin DOUT=3'b010; end
		else if(DIN[4]==0) begin DOUT=3'b011; end
		else if(DIN[3]==0) begin DOUT=3'b100; end
		else if(DIN[2]==0) begin DOUT=3'b101; end
		else if(DIN[1]==0) begin DOUT=3'b110; end
		else               begin DOUT=3'b111; end
		end
endmodule
		