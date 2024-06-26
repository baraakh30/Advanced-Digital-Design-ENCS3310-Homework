module BCD_7Segment_driver (
  input [3:0] bcd_input,
  output reg [6:0] segment_output
);

always @* begin
  case (bcd_input)
    4'b0000: segment_output = 7'b0111111;  // 0
    4'b0001: segment_output = 7'b0000110;  // 1
    4'b0010: segment_output = 7'b1011011;  // 2
    4'b0011: segment_output = 7'b1001111;  // 3
    4'b0100: segment_output = 7'b1100110;  // 4
    4'b0101: segment_output = 7'b1101101;  // 5
    4'b0110: segment_output = 7'b1111101;  // 6
    4'b0111: segment_output = 7'b0000111;  // 7
    4'b1000: segment_output = 7'b1111111;  // 8
    4'b1001: segment_output = 7'b1101111;  // 9
    default: segment_output = 7'b1111111;  // Default case (all segments off)
  endcase
end

endmodule
