module contador_mod10 (input logic clk, rst, output logic [3:0] cont);

always_ff @(posedge clk or negedge rst) begin
	if (rst == 0)
		cont <= 0;
	else if (cont == 9)
		cont <= 0;
	else
		cont <= cont + 1;
	
end
endmodule
