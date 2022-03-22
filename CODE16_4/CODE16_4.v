module CODE16_4(x,y,e);
	input wire [15:0] x ;
	output reg [3:0] y;
	output reg       e;
	integer i;
	integer j=0;
	always@(*)
		begin
			for(i=0;i<16;i=i+1)
				begin
					if(x[i]==1) y<=i;
					else		j=j+1;
				end
				if(j==16) e<= 1;
				else	  e<=0;
		end
endmodule