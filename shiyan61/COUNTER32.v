module 	COUNTER32 (CLR,	ENABL,	Fin,	DOUT, COUT);
	input CLR;
	input ENABL;
	input Fin;
	output  COUT;
	output [3 :0] DOUT;
	reg [3 :0] DOUT;
	reg COUT;
	always @ (posedge Fin or posedge CLR )
		if (CLR)
			DOUT<=0;
		else if (ENABL==1)
		  begin
             if( DOUT<9) 
			   DOUT<=DOUT +1;
		    else
			  DOUT<=0;
		  end
		  
	 
		always @(DOUT)
		   if (DOUT==9)	
		      COUT<=1;
		     else
		      COUT<=0;
		   
			
endmodule
