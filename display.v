module display (
  input wire[3:0] A,
  input wire[3:0] B,
  input wire clk,  // Control input for Mux_74HC157
  input wire nEN, // Active-low enable input for Decoder   
  input wire DecodernEN,
  output reg [6:0] display_A, // Output for Display A
  output reg [6:0] display_B,  // Output for Display B
  output wire [6:0] bcd_driver_output,
  output wire display_wire
);

  reg [3:0] mux_output;
  reg [3:0] decoder_output;

  // 2-to-1 Mux for selecting inputs A or B based on the clock and G signal
  Quad_Mux2x1 mux (
    .A(A),
    .B(B),
    .G(clk),
    .nEN(nEN),
    .out(mux_output)
  );

  // Decoder for selecting active display based on A1 and B1
  Decoder2x4 decoder (
  .address({clk, DecodernEN}),
  .g_n(DecodernEN) , 
  .out(display_wire)
  );

  // BCD to 7-segment driver
  BCD_7Segment_driver bcd_driver (
    .bcd_input(mux_output),
    .segment_output(bcd_driver_output)
  );

  always @( clk or display_wire) begin
    // Display A is active when decoder_output[1] is low
    if (display_wire == 1'b0) begin
      assign display_A = bcd_driver_output;	
	  assign display_B = 7'bxxxxxxx;
    end
    // Display B is active when decoder_output[0] is low
    else if (display_wire == 1'b1)  begin
     assign display_B = bcd_driver_output;	 
	 assign display_A =  7'bxxxxxxx;
    end
  end

endmodule
