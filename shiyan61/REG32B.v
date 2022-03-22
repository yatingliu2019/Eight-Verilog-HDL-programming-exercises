module REG32B (LK, DIN, DAT32);

input LK;
input [9:0] DIN;
output [9:0] DAT32;
reg [9:0] DAT32;
always @ (posedge LK)
		if(LK)
			DAT32<=DIN;
		else
			DAT32<=DAT32;
endmodule