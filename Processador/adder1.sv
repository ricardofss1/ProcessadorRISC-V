module adder1 (
input logic [11:0] in1, in2,
output logic [11:0] out);

always @(*) begin
		out = in1 + in2;
end

endmodule
