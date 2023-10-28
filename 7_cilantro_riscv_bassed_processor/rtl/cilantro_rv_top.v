module cilantro_rv_top(
	input clk,
	input rst,
	input [31:0] instr_in,
	output [31:0] data_out
);

// Register File
reg [31:0] reg_file [0:31];
reg [4:0] rs1, rs2, rd; // Reg address
reg [31:0] imm;
reg [6:0] opcode;
reg [31:0] PC;

// ALU Output
reg [31:0] alu_out;

reg [31:0] data_out;

// Memory 4KB
reg [31:0] memory [1023:0];

// Instruction Fetch stage
always @(posedge clk) begin
	if (rst) begin
		PC <= 32'b0;
	end else begin
		PC <= PC + 4;
	end
end

// Instruction Decode stage
always @(posedge clk) begin
	if (rst) begin
		opcode  <=  7'b0;
		rs1     <=  5'b0;
		rs2     <=  5'b0;
		rd      <=  5'b0;
		imm     <=  32'b0;
	end else begin
		opcode  <=  instr_in[6:0];
		rs1     <=  instr_in[19:15];
		rs2     <=  instr_in[24:20];
		rd      <=  instr_in[11:7];
		imm     <=  {{20{instr_in[31]}}, instr_in[31:20]};
	end
end

reg reg_read_data1, reg_read_data2;

// Register file Read
always @(posedge clk) begin
	reg_read_data1 <= reg_file[rs1];
	reg_read_data2 <= reg_file[rs2];
end

// ALU
always @(posedge clk) begin
	if (rst) begin
		alu_out <= 'b0;
	end else begin
		case (opcode) 
			7'b0110011: alu_out <= reg_read_data1 + reg_read_data2; // ADD operation
			7'b0110100: alu_out <= reg_read_data1 | reg_read_data2; // OR operation
			7'b0110101: alu_out <= reg_read_data1 & reg_read_data2; // AND operation
			default: alu_out <= 'b0;
		endcase
	end
end

// Memory unit (LOAD instruction)
always @(posedge clk) begin
	if (rst) begin
		data_out <= 'b0;
	end else begin
		if (opcode == 7'b0000011) begin // Load instruction
			data_out <= memory[alu_out];
		end
	end
end

// Memory unit (STORE instruction)
always @(posedge clk) begin
	if (rst) begin
		data_out <= 'b0;
	end else begin
		if (opcode == 7'b0100011) begin // Load instruction
			memory[alu_out] <= reg_read_data2;
		end
	end
end

// Write Back stage
always @(posedge clk) begin
	if (!rst) begin
		if (opcode == 7'b0110011) begin // ADD instruction
			if (rd != 0) begin
				reg_file[rd] <= alu_out;
			end
		end else if (opcode == 7'b0000011) begin // LOAD instruction
			if (rd != 0) begin
				reg_file[rd] <= data_out;
			end
		end
	end
end

reg [2:0] alu_op;
reg write_en_reg;
reg mem_rd_en;
reg mem_wr_en;

// Control Logic
always @(posedge clk) begin
	if (rst) begin
		alu_op <= 'b0;
		write_en_reg <= 'b0;
		mem_rd_en <= 'b0;
		mem_wr_en <= 'b0;
	end else begin
		case (opcode)
			7'b0110011: begin // R type 
				alu_op <= 3'b000;
				write_en_reg <= 1'b1;
			end
			7'b0000011: begin // I type 
				alu_op <= 3'b000;
				mem_rd_en <= 'b1;
				write_en_reg <= 1'b1;
			end
			7'b0100011: begin // I type 
				alu_op <= 3'b000;
				mem_wr_en <= 'b1;
			end
			default: begin
				alu_op <= 'b0;
				write_en_reg <= 'b0;
				mem_rd_en <= 'b0;
				mem_wr_en <= 'b0;
			end
		endcase
	end
end

endmodule // cilantro_rv
