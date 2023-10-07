module Mux_21_NBits #(parameter WIDTH) (input logic [WIDTH-1:0] i0,
input logic[WIDTH-1:0] i1, input logic sel, output logic [WIDTH-1:0] out);

always @* begin

if (sel)
	out = i1;
else
	out = i0;

end

endmodule
