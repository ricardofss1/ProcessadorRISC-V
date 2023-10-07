`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);
//---------- modifique a partir daqui --------

// assign LEDG[0] = KEY[1];
// assign LEDG[1] = KEY[1];
// assign LEDG[2] = KEY[2];

/*
assign HEX0[0] = SW[6];
assign HEX0[1] = SW[5];
assign HEX0[2] = SW[4];
assign HEX0[3] = SW[3];
assign HEX0[4] = SW[2];
assign HEX0[5] = SW[1];
assign HEX0[6] = SW[0];
*/
// Mux_21_8Bits (.i0(SW[7:0]), .i1(SW[15:8]), .sel(SW[17]), .out(LEDR[7:0]));
// Mux_21_NBits #(2) (.i0(SW[7:0]), .i1(SW[15:8]), .sel(SW[17]), .out(LEDR[7:0]));

//decod_hex_7seg decod1(.hex_int(SW[3:0]), .seg_out(HEX0[0:6]));
//decod_hex_7seg decod2(.hex_int(SW[7:4]), .seg_out(HEX1[0:6]));

//div_freq div1(.clock_rapido(CLOCK_50), .clock_lento(LEDG[0]));

// wire fio1;
// wire [3:0] fio2;

decod_hex_7seg decod1(.hex_int(w_instOP), .seg_out(HEX0[0:6]));
decod_hex_7seg decod2(.hex_int(w_instFunct3), .seg_out(HEX1[0:6]));
decod_hex_7seg decod3(.hex_int(w_instFunct7), .seg_out(HEX2[0:6]));
decod_hex_7seg decod4(.hex_int(w_instFunct7), .seg_out(HEX3[0:6]));

// div_freq div2(.clock_rapido(CLOCK_50), .clock_lento(fio1));
	
// contador_mod10 cont1(.clk(fio1), .rst(KEY[1]), .cont(fio2));

/*
RegisterFile reg1 (.wd3(SW[7:0]), .wa3(SW[16:14]), .we3(SW[17]), .clk(KEY[1]),
.rst(KEY[0]), .ra1(SW[13:11]), .ra2(SW[10:8]), .rd1(w_d0x0[7:0]), .rd2(w_d0x1[7:0]));

*/

// assign LEDG[8] = ~KEY[1];

wire w_ULASrc;
wire w_RegWrite;
wire [2:0] w_ULAControl;
wire [7:0] w_PCp4;
wire [7:0] w_PC;
wire [7:0] w_rd1SrcA;
wire [7:0] w_rd2;
wire [7:0] w_SrcB;
wire [7:0] w_ULAResult;
wire [32:0] w_Inst;

wire [6:0] w_instOP;
wire [2:0] w_instFunct3;
wire [6:0] w_instFunct7;
wire [4:0] w_instRs1;
wire [5:0] w_instRs2;
wire [4:0] w_instRd;
wire [11:0] w_instIMM;

wire w_MemWrite;
wire w_ResultSrc;
wire [7:0] w_Wd3;
wire [11:0] w_imm;
wire [7:0] w_RData;

wire w_PCSrc, w_Zero, w_Branch;
wire [1:0] w_ImmSrc;
wire [7:0] w_immPC;
wire [7:0] w_PCn;

assign w_instOP = w_Inst[6:0];
assign w_instFunct3 = w_Inst[14:12];
assign w_instFunct7 = w_Inst[31:25];
assign w_instRs1 = w_Inst[19:15];
assign w_instRs2 = w_Inst[24:20];
assign w_instRd = w_Inst[11:7];
assign w_instIMM = w_Inst[31:20];

assign w_d0x4 = w_PC;

assign LEDG[0] = w_Zero;
assign LEDG[3] = ~KEY[3];
assign LEDG[2] = ~KEY[2];
assign LEDG[1] = ~KEY[1];

adder4 ad(.in(w_PC), .out(w_PCp4));

RegisterFile reg2 (.wd3(w_Wd3), .wa3(w_instRd), .we3(w_RegWrite),
.clk(w_clk),
.rst(KEY[1]), .ra1(w_instRs1), .ra2(w_instRs2), .rd1(w_rd1SrcA),
.rd2(w_rd2), .s0(w_d0x0), .s1(w_d0x1), .s2(w_d0x2), .s3(w_d0x3), .s4(w_d1x0),
.s5(w_d1x1), .s6(w_d1x2), .s7(w_d1x3));

//Mux_21_8Bits mux2(.i0(w_immPC), .i1(w_PCp4), .sel(w_PCSrc), .out(w_PCn));
assign w_SrcB = (w_ULASrc) ? w_imm : w_rd2;
assign w_PCn = (w_PCSrc) ? w_immPC : w_PCp4;
assign w_Wd3 = (w_ResultSrc) ? w_RegData : w_ULAResult;

// Mux_21_8Bits mux3(.i0(w_rd2), .i1(w_instIMM), .sel(w_ULASrc), .out(w_SrcB));

// Mux_21_8Bits mux4(.i0(w_rd2), .i1(w_instIMM), .sel(w_ULASrc), .out(w_SrcB));

ULA ula1(.SrcA(w_rd1SrcA), .SrcB(w_SrcB), .ULAControl(w_ULAControl),
.ULAResult(w_ULAResult), .FlagZ(w_Zero));

ControlUnit controlunit1(.OP(w_instOP), .Funct3(w_instFunct3),
.Funct7(w_instFunct7),
.ULAControl(w_ULAControl) ,.ULASrc(w_ULASrc), .RegWrite(w_RegWrite), 
.ImmSrc(w_ImmSrc), .Branch(w_Branch), .MemWrite(w_MemWrite), .ResultSrc(w_ResultSrc));

ProgramCounter pg1(.clk(w_clk), .rst(KEY[1]), .PCin(w_PCn), .PC(w_PC));

InstMem instmem(.A(w_PC),.RD(w_Inst[32:0]));

DataMem dm(.A(w_ULAResult), .WD(w_rd2), .rst(KEY[1]),
 .clk(w_clk), .WE(w_MemWrite), .RD(w_RData));

assign LEDR[0] = w_ResultSrc;
assign LEDR[1] = w_MemWrite;
assign LEDR[4:2] = w_ULAControl;
assign LEDR[5] = w_ULASrc;
assign LEDR[6] = w_ImmSrc;
assign LEDR[7] = w_RegWrite;

wire w_clk;

pand pand1(
.in1(w_Branch), .in2(w_Zero),
.out(w_PCSrc)
);

div_freq (.clock_rapido(CLOCK_50), .clock_lento(w_clk));

adder1 a1(
.in1(w_imm), .in2(w_PC),
.out(w_immPC));
 
Mux_41_8Bits mux41(
.i0(w_Inst[31:20]),
.i1({w_Inst[31:25], w_Inst[11:7]}),
.i2({ w_Inst[7], w_Inst[30:25], w_Inst[11:8], 1'b0}), .i3(11'bx),
.sel(w_ImmSrc), .out(w_imm));

wire w_and1;
wire w_and2;

pand pand2(
.in1(w_MemWrite), .in2(w_and1),
.out(w_and2)
);

reg8bits reg8bits1(.EN(w_and2), .D(w_rd2), .rst(KEY[1]), .clk(w_clk), .DataOut(w_d1x4)
);

wire [7:0] w_Datain;
wire [7:0] w_RegData;
assign w_Datain = SW[7:0];

Mux_21_8Bits mux2(.i0(w_RData), .i1(w_Datain), .sel(w_comp), .out(w_RegData));

wire w_comp;

comparador comp1(.in(w_ULAResult), .out(w_and1));
comparador comp2(.in(w_ULAResult), .out(w_comp));

endmodule
