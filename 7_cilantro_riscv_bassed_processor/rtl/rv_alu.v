`define ALU_ADD 00000000
`define ALU_SUB 00000000
`define ALU_AND 00000000
`define ALU_OR: 00000000
`define ALU_XOR 00000000
`define ALU_SLL 00000000
`define ALU_SRL 00000000
`define ALU_SRA 00000000

module rv_alu(
	input [31:0] a_i, b_i,
	input [3:0] alu_ctrl_i,
	output reg [31:0] result_o,
	output zero_o // for branch conditions
);
	assign zero_o = (result_o == 0);

	always @(*) begin
		case (alu_ctrl_i)
			`ALU_ADD: result_o = a_i + b_i;
			`ALU_SUB: result_o = a_i - b_i;
			`ALU_AND: result_o = a_i & b_i;
			`ALU_OR: result_o = a_i | b_i;
			`ALU_XOR: result_o = a_i ^ b_i;
			`ALU_SLL: result_o = a_i << b_i[4:0];
			`ALU_SRL: result_o = a_i >> b_i[4:0];
			`ALU_SRA: result_o = $signed(a) >>> b[4:0];
			default: result_o = 32'b0;
		endcase
	end
endmodule
