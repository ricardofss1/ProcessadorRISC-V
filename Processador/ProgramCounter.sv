module ProgramCounter (
input logic clk, rst,
input logic [7:0] PCin,
output logic [7:0] PC
);

always @(posedge clk or negedge rst) begin
	if (rst == 0) begin
		PC <= 0; // reseta PC para zero
	end
	else begin
		PC <= PCin;
	end
end

endmodule
