module Mux_41_8Bits (
input logic [12:0] i0, i1, i2, i3,
input logic [1:0]sel, output logic [7:0] out);

always @(*) begin
case(sel)
	2'b00: out = i0;
	2'b01: out = i1;
	2'b10: out = i2;
	default: out = 8'b0;
	
endcase
end

endmodule