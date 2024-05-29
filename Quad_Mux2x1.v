module Quad_Mux2x1 (
  input wire[3:0] A,
   input wire[3:0] B,
  input wire G,   // Control input
  input wire nEN, // Active-low enable input
  output reg [3:0] out
);

reg [3:0] mux_out;

always @( posedge G or negedge G or nEN
	) begin
  if (~G &&~nEN) begin
    // When nEN is low, select inputs A3, A2, A1, A0
    mux_out = A;
  end else if (G &&~nEN) begin
    // When G is high and nEN is high, select inputs B3, B2, B1, B0
    mux_out = B;
  end
end

assign out = mux_out;

endmodule
