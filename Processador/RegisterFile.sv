parameter DATA_WIDTH = 16;
parameter NUM_REGISTERS = 16;

module RegisterFile (
    input logic [$bits(wd)-1:0] wd3,
    input logic [$clog2(NUM_REGISTERS)-1:0] wa3,
    input logic we3,
    input logic clk, rst,
    input logic [$clog2(NUM_REGISTERS)-1:0] ra1,
    input logic [$clog2(NUM_REGISTERS)-1:0] ra2,
    output logic [$bits(wd)-1:0] rd1,
    output logic [$bits(wd)-1:0] rd2,
    output logic [$bits(wd)-1:0] s [$clog2(NUM_REGISTERS)-1:0],
	 
	output logic [15:0] s0,
    output logic [15:0] s1,
    output logic [15:0] s2,
    output logic [15:0] s3,
    output logic [15:0] s4,
    output logic [15:0] s5,
    output logic [15:0] s6,
    output logic [15:0] s7
);

    // Array de registradores
    logic [$bits(wd)-1:0] register [0:NUM_REGISTERS-1];

    always @(posedge clk or negedge rst) begin
        if (rst == 0) begin
            for (int i = 0; i < NUM_REGISTERS; i = i + 1)
                register[i] <= {$bits(wd3){1'b0}};
        end
        else if (we3) begin
            register[wa3] <= wd3;
        end
    end

    // Operação de leitura
    always @* begin
        // Realiza operações de leitura para os registradores especificados
        rd1 = (ra1 == 0) ? {$bits(wd3){1'b0}} : register[ra1];
        rd2 = (ra2 == 0) ? {$bits(wd3){1'b0}} : register[ra2];
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
