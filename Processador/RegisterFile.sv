module RegisterFile (
    input logic [15:0] wd3,
    input logic [3:0] wa3,
    input logic we3,
    input logic clk, rst,
    input logic [3:0] ra1,
    input logic [3:0] ra2,
    output logic [15:0] rd1,
    output logic [15:0] rd2,

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
logic [15:0] register [0:15];

always @(posedge clk or negedge rst) begin
    if (rst == 0) begin
        for (int i = 0; i < 16; i = i + 1)
            register[i] <= 16'b0;
    end
    else if (we3) begin
        register[wa3] <= wd3;
    end
end

// Operação de leitura
always @* begin
    rd1 = (ra1 == 4'b0000) ? 16'b0 : register[ra1];
    rd2 = (ra2 == 4'b0000) ? 16'b0 : register[ra2];

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
