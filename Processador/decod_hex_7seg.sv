module decod_hex_7seg (input logic [3:0] hex_int, output logic [0:6] seg_out);

always_comb begin
	case (hex_int)
		4'h0: seg_out = 7'b0000001;
		4'h1: seg_out = 7'b1001111;
		4'h2: seg_out = 7'b0010010;
		4'h3: seg_out = 7'b0000110;
		4'h4: seg_out = 7'b1001100;
		4'h5: seg_out = 7'b0100100;
		4'h6: seg_out = 7'b0100000;
		4'h7: seg_out = 7'b0001111;
		4'h8: seg_out = 7'b0000000;
		4'h9: seg_out = 7'b0000100;
		4'ha: seg_out = 7'b0001000;
		4'hb: seg_out = 7'b1100000;
		4'hc: seg_out = 7'b0110001;
		4'hd: seg_out = 7'b1000010;
		4'he: seg_out = 7'b0110000;
		4'hf: seg_out = 7'b0111000;
		default: seg_out = 7'b1111111;
endcase

end

endmodule
