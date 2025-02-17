module rv_imm_gen (
    input [31:0] instruction,
    output reg [31:0] imm
);
    always @(*) begin
        case (instruction[6:0]) // Opcode
            7'b0010011, 7'b0000011: // I-Type
                imm = {{20{instruction[31]}}, instruction[31:20]};
            7'b0100011: // S-Type
                imm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
            7'b1100011: // B-Type
                imm = {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
            7'b0110111, 7'b0010111: // U-Type
                imm = {instruction[31:12], 12'b0};
            7'b1101111: // J-Type
                imm = {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};
            default:
                imm = 32'b0;
        endcase
    end
endmodule

