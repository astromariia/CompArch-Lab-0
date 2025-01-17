module stimulus ();

   logic   clock;
   logic   Enable;

   logic [4:0] ra1, ra2, wa3;

   logic   [31:0] Writein,Read1,Read2;
    
   integer handle3;
   integer desc3;
   
   `timescale 1ns/100ps
   // Instantiate DUT
   regfile dut (clock,Enable,ra1, ra2, wa3,Writein,Read1,Read2);

   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clock = 1'b1;
	forever #5 clock = ~clock;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("regtest.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#10 $fdisplay(desc3, "Ra1 =%b \n Ra2 = %b ", 
		     ra1, ra2 );
     end

     initial 
       begin
        #0 ra1= 5'b00000;
        #0 ra2= 5'b00000;








       end

endmodule