module div_freq (input logic clock_rapido, output logic clock_lento);

// contador suficientemente grande
logic [31:0] t = 0;

always @(posedge clock_rapido) begin
	if (t == 25000000 / 2) begin
		t <= 0;
		clock_lento = ~clock_lento;
	end
	else begin
		t <= t + 1;
	end
end

endmodule		
