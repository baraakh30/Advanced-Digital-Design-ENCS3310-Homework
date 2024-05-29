module Decoder2x4 (
  input [1:0] address,
  input g_n, // Enable (active low)
  output reg [3:0] out
);

  always @( posedge address[1]  or negedge address[1]) begin
    if (~g_n) begin
      case (address)
        2'b00: out = 1'b0;
        2'b01: out = 1'b1;
       
        default: out = 1'b1; // All outputs off for unknown address
      endcase
    end
  end

endmodule
