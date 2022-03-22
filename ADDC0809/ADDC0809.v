module ADDC0809(D,CLK,EOC,RST,ALE,START,OE,ADDA,Q,LOCK_T);
	input [7:0] D;
	input CLK,RST;
	input EOC;
	output ALE;
	output START,OE;
	output ADDA,LOCK_T;
	output [7:0] Q;
	reg ALE,START,OE;
	parameter s0=0,s1=1,s2=2,s3=3,s4=4;
	reg [4:0] cs,next_state;
	reg [7:0] REGL;reg LOCK;
	always@(cs or EOC) begin
		case (cs)
		  s0:begin ALE=0;START=0;OE=0;LOCK=0;
				  next_state<=s1; end
		  s1:begin ALE=1;START=1;OE=0;LOCK=0;
				  next_state<=s2; end
		  s2:begin ALE=0;START=0;OE=0;LOCK=0;
			if(EOC==1'b1) next_state<=s3; 
			else next_state<=s2;  end 
		  s3:begin ALE=0;START=0;OE=1;LOCK=0;
				next_state<=s4; end
		  s4:begin ALE=0;START=0;OE=1;LOCK=1;
				next_state<=s0; end
		  default:begin ALE=0;START=0;OE=0;LOCK=0;
				next_state<=s0; end
		endcase end
	always@(posedge CLK or posedge RST) begin
			if(RST) cs<=s0;else cs <=next_state; end
	always@(posedge LOCK) if(LOCK) REGL<=D;
	assign ADDA=1;assign Q=REGL;
	assign LOCK_T=LOCK;
	endmodule