module test;

  // Inputs	  
   reg [3:0] A,B;
  
  reg  clk, DecodernEN, nEN;

  // Outputs
  wire [6:0] display_A, display_B,bcd_out; 
  wire diswire;

  // Instantiate the DisplayControl module
  display uut (
    .A(A),
    .B(B),
    .clk(clk),
    .DecodernEN(DecodernEN),
    .nEN(nEN),
    .display_A(display_A),
    .display_B(display_B),
	.bcd_driver_output(bcd_out), 
	.display_wire(diswire)
	
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Stimulus
  initial begin
    // Initialize inputs 
	A=4'b1001 ;
	B=4'b0000;
 
    clk = 0; nEN = 1;

    #10 nEN = 0; // Enable MUX
	#10 DecodernEN = 0; // Enable Decoder
   

    #100 $finish; // End the simulation after 100 time units
  end

endmodule
