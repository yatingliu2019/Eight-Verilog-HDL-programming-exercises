module FREQ_C ( CLK1Hz,Fin,DATOUT);
	input CLK1Hz;
	input Fin;
	output [31:0] DATOUT;
	
	wire CNT_EN;
	wire LOAD;
	wire reset;
	
	FTCTRL ftctrl (
		.CLKK(CLK1Hz),
		.RST_CNT(reset),
		.CNT_EN(CNT_EN),
		.LOAD(LOAD)
	);
	wire [3:0] DATA1;
	wire c1;
	COUNTER32 u1 (
		.CLR(reset),
		.ENABL(CNT_EN),
		.Fin(Fin),
		.DOUT(DATA1),
		.COUT(c1)
	);
	
	wire [3:0] DATA2;
	wire c2;
	COUNTER32 u2 (
		.CLR(reset),
		.ENABL(CNT_EN),
		.Fin(c1),
		.DOUT(DATA2),
		.COUT(c2)
	);
	
	wire [3:0] DATA3;
	wire c3;
	COUNTER32 u3 (
		.CLR(reset),
		.ENABL(CNT_EN),
		.Fin(c2),
		.DOUT(DATA3),
		.COUT(c3)
	);	
	
	wire [3:0] DATA4;
	wire c4;
	COUNTER32 u4 (
		.CLR(reset),
		.ENABL(CNT_EN),
		.Fin(c3),
		.DOUT(DATA4),
		.COUT(c4)
	);
	
	wire [3:0] DATA5;
	wire c5;
	COUNTER32 u5 (
		.CLR(reset),
		.ENABL(CNT_EN),
		.Fin(c4),
		.DOUT(DATA5),
		.COUT(c5)
	);
	
	
	wire [3:0] DATA6;
	wire c6;
	COUNTER32 u6 (
		.CLR(reset),
		.ENABL(CNT_EN),
		.Fin(c5),
		.DOUT(DATA6),
		.COUT(c6)
	);
	
	wire [3:0] DATA7;
	wire c7;
	COUNTER32 u7 (
		.CLR(reset),
		.ENABL(CNT_EN),
		.Fin(c6),
		.DOUT(DATA7),
		.COUT(c7)
	);
	
	wire [3:0] DATA8;
	wire c8;
	COUNTER32 u8 (
		.CLR(reset),
		.ENABL(CNT_EN),
		.Fin(c7),
		.DOUT(DATA8),
		.COUT(c8)
	);
	
	wire [31:0] DATOUT;
	wire [31:0] DAIN;
	 assign DAIN ={DATA8,DATA7,DATA6,DATA5,DATA4,DATA3,DATA2,DATA1};
	
	
	REG32B reg32b(
		.LK(LOAD),
		.DIN(DAIN),
		.DAT32(DATOUT)
	
	);
endmodule