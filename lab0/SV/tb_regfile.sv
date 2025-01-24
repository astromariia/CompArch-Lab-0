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
	//desc3 = handle3;
  /*
	#10 $fdisplay(desc3, "Ra1 =%b \n Ra2 = %b ", 
		     ra1, ra2 );
         */
     end

     initial 
       begin
        #0 desc3= handle3;
        #0 ra1= 5'b00000;
        #0 ra2= 5'b00000;
        #0 Enable=1'b1; //enable writing
        #10 wa3=5'b00001; //on rising edge of clock cycle, set that we want to write into register 1
        #0 Writein='1; //write 32 1s into the register
        #0 ra1=5'b00001; //want to read register 1
        #0 $fdisplay(desc3, "does rf[1]=what we just wrote? %b",Writein==Read1);
        #10 ra2=5'b00010;
        #0 wa3=5'b00010; // after this write, both registers 1 and 2 should be 32 1s
        #0 $fdisplay(desc3, "rf[1]= %b /n rf[2]=%b",Read1,Read2); //test 2, reading both registers
        #10 ra1=5'b00000; // we're gonna try to write to register 0
        #0 wa3=5'b00000;
        #0 $fdisplay(desc3, "rf[0]= %b",Read1); 
        #10 wa3=5'b00011; //now we're gonna try to concurrently write and read to the same register
        #0 ra1=5'b00011; // still using the same message of all 1s
        #0 $fdisplay(desc3, "rf[3]= %b",Read1);
        #10 Enable=1'b0;
        #0 wa3=5'b00100;
        #0 ra1=5'b00100;// set both to register 4
        #0 $fdisplay(desc3, "rf[4]=%b",Read1); //should display all 0s still
        

        











       end

endmodule