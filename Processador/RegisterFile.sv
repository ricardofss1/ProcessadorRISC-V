module RegisterFile (
    input logic [7:0] wd3,         // Dado de escrita
    input logic [4:0] wa3,         // Endereço de escrita
    input logic we3,              // Habilitação de escrita
    input logic clk, rst,         // Sinal de clock e reset
    input logic [4:0] ra1,        // Endereço de leitura 1
    input logic [4:0] ra2,        // Endereço de leitura 2
    output logic [7:0] rd1,       // Dado de leitura 1
    output logic [7:0] rd2,       // Dado de leitura 2

    output logic [7:0] s0,        // Saída do registrador 0
    output logic [7:0] s1,        // Saída do registrador 1
    output logic [7:0] s2,        // Saída do registrador 2
    output logic [7:0] s3,        // Saída do registrador 3
    output logic [7:0] s4,        // Saída do registrador 4
    output logic [7:0] s5,        // Saída do registrador 5
    output logic [7:0] s6,        // Saída do registrador 6
    output logic [7:0] s7         // Saída do registrador 7
);

// Array de registradores
logic [7:0] register [0:7];
int i;

always @(posedge clk or negedge rst) begin
	if (rst == 0) begin
		register[0] <= 8'b0;
		register[1] <= 8'b0;
		register[2] <= 8'b0;
		register[3] <= 8'b0;
		register[4] <= 8'b0;
		register[5] <= 8'b0;
		register[6] <= 8'b0;
		register[7] <= 8'b0;
		//for (i = 0; i < 8 ; i = i + 1);
			//register [i] <= 8'b0; // operação de reset
	end
	else if (we3) begin
		register [wa3] <= wd3; // escrita
	end
end

// operacao de leitura
always @(*) begin
	//rd1 = register[ra1]:
	//rd2 = register[ra2];
	rd1 = (ra1 == 3'b000) ? 8'b0 : register[ra1];
	rd2 = (ra2 == 3'b000) ? 8'b0 : register[ra2];
	s0 = register[0];
	s1 = register[1];
	s2 = register[2];
	s3 = register[3];
	s4 = register[4];
	s5 = register[5];
	s6 = register[6];
	s7 = register[7];

end


endmodule
