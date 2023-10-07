module InstMem (
input logic [7:0] A,
output logic [31:0] RD
);


always @(*) begin
	case (A)
		8'h00: RD = 32'h00100093;
		8'h04: RD = 32'h0ff00103;
		8'h08: RD = 32'h001171b3;
		8'h0c: RD = 32'h00018a63;
		8'h10: RD = 32'h00118263;
		8'h14: RD = 32'h00000233;
		8'h18: RD = 32'h0e000fa3;
		8'd28: RD = 32'hfe0002e3;
		8'd32: RD = 32'h00100233;
		8'd36: RD = 32'h0e400fa3;
		8'd40: RD = 32'hfc000ce3;
	/*
		8'h00: RD = 32'h0ff00083;
		8'h04: RD = 32'h0e100fa3;
		8'h08: RD = 32'hfe000ce3;
	*/
	/*
		8'h00: RD = 32'h00700093;
		8'h04: RD = 32'h00300193;
		8'h08: RD = 32'hfff00113;
		8'h0c: RD = 32'h00110113;
		8'h10: RD = 32'h003123b3;
		8'h14: RD = 32'hfe208ae3;
		8'h18: RD = 32'hfe000ae3;
	*/
		default: RD = 32'h00000000;
	endcase
end

endmodule
