module stimulus ();

   logic   clock;
   logic   Enable;

   logic [4:0] ra1, ra2, wa3;

   logic   In;
   
   logic   Out;
   
   integer handle3;
   integer desc3;
   
   `timescale 1ns/100ps
   // Instantiate DUT
   regfile dut (clock, In, Out);

   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clock = 1'b1;
	forever #5 clock = ~clock;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("test.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#10 $fdisplay(desc3, "%b %b || %b", 
		     reset, In, Out);
     end