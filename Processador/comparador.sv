module comparador (
input logic [7:0] in,
output logic out
);

always @(*) begin
	out = (in == 8'hff) ? 1 : 0;
end

endmodule
