module Mux_21_8Bits (input logic [7:0] i0, input logic [11:0] i1,
							input logic sel, output logic [7:0] out);
							
always @* begin
if (sel)
	out = i1;
else
	out = i0;
end

endmodule
