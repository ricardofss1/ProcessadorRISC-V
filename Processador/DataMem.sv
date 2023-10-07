module DataMem (
input logic [7:0] A, WD,
input logic rst, clk, WE,
output logic [7:0] RD
);


int i;
logic [7:0] mem[0:255];

always @(posedge clk or negedge rst) begin
	if (rst == 0) begin
		mem[0] <= 0;
		mem[1] <= 0;
		mem[2] <= 0;
		mem[3] <= 0;
		mem[4] <= 0;
		mem[5] <= 0;
		mem[6] <= 0;
		mem[7] <= 0;
		//for (i = 0; i < 256; i = i +1)
		//mem[i] <= 0;
	end
	
	else if (WE) begin //escrita
		mem[A] <= WD;
	end

end

assign RD = mem[A]; // leitura

endmodule
