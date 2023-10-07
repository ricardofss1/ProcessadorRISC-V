module ControlUnit (
input logic [6:0] OP,
input logic [2:0] Funct3,
input logic [6:0] Funct7,
output logic [2:0] ULAControl,
output logic [1:0] ImmSrc,
output logic ULASrc, RegWrite, Branch, MemWrite, ResultSrc
);


always @(*) begin
	RegWrite = 1;
	case (OP) 
		7'b0110011: begin
			case (Funct3)
				3'b000: begin 
					case (Funct7) // ADD e SUB
						7'b0000000: begin
							ImmSrc = 2'bxx;
							ULASrc = 0;
							ULAControl = 3'b000;
							MemWrite = 0;
							ResultSrc = 0;
							Branch = 0;
						end
						7'b0100000: begin
							ULASrc = 0;
							ULAControl = 3'b001;
							ImmSrc = 2'bxx;
							MemWrite = 0;
							ResultSrc = 0;
							Branch = 0;

						end

					endcase
				end
				3'b111: begin // AND
					case (Funct7)
						7'b0000000: begin
							ULASrc = 0;
							ULAControl = 3'b010;
							ImmSrc = 2'bxx;
							MemWrite = 0;
							ResultSrc = 0;
							Branch = 0;
						end
						
					endcase
				end
				3'b110: begin // OR
					case (Funct7)
						7'b0000000: begin
							ULASrc = 0;
							ULAControl = 3'b011;
							ImmSrc = 2'bxx;
							MemWrite = 0;
							ResultSrc = 0;
							Branch = 0;
						end
						
					endcase
				end
				3'b010: begin
					case (Funct7) // SLT
						7'b0000000: begin
							ULASrc = 0;
							ULAControl = 3'b101;
							ImmSrc = 2'bxx;
							MemWrite = 0;
							ResultSrc = 0;
							Branch = 0;
						end
						
					endcase
				end
			endcase
		end
		7'b0010011: begin // ADDI
			case (Funct3)
				3'b000: begin
					ULASrc = 1;
					ULAControl = 3'b000;
					ImmSrc = 0;
					MemWrite = 0;
					ResultSrc = 0;
					Branch = 0;
				end
			endcase
		end
		7'b0000011: begin // LB
			case (Funct3)
				3'b000: begin
					ULASrc = 1;
					ULAControl = 3'b000;
					ImmSrc = 0;
					MemWrite = 0;
					ResultSrc = 1;
					Branch = 0;
				end
			endcase
		end
		7'b0100011: begin // SB
			case (Funct3)
				3'b000: begin
					RegWrite = 0;
					ULASrc = 1;
					ULAControl = 3'b000;
					ImmSrc = 1;
					MemWrite = 2'b01;
					ResultSrc = 1'bx;
					Branch = 0;
				end
			endcase
		end
		7'b1100011: begin // BEQ
			case (Funct3)
				3'b000: begin
					RegWrite = 0;
					ULASrc = 0;
					ULAControl = 3'b001;
					ImmSrc = 2'b10;
					MemWrite = 0;
					ResultSrc = 1'bx;
					Branch = 1;
				end
			endcase
		end
		default: begin
				RegWrite = 0;
				ULASrc = 0;
				ULAControl = 3'b000;
				ImmSrc = 0;
				MemWrite = 0;
				ResultSrc = 1'b0;
				Branch = 0;
			end
		endcase	
end

endmodule
