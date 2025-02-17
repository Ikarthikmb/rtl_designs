module rv_reg_file(
	input clk,
	input [4:0] read_reg1_i, read_reg2_i, write_reg_i, 
	input [31:0] write_data_i,
	input reg_write_i,
	output [31:0] read_data1_o, read_data2_o
);
	reg [31:0] registers [0:31];

	integer i;
	
	initial begin
		registers[0] = 32'b0;  // ensures x0 is always zero
		registers[1] = 32'b0;
		registers[2] = 32'b0;
		registers[3] = 32'b0;
		registers[4] = 32'b0;
		registers[5] = 32'b0;
		registers[6] = 32'b0;
		registers[7] = 32'b0;
		registers[8] = 32'b0;
		registers[9] = 32'b0;
		registers[10] = 32'b0;
		registers[11] = 32'b0;
		registers[12] = 32'b0;
		registers[13] = 32'b0;
		registers[14] = 32'b0;
		registers[15] = 32'b0;
		registers[16] = 32'b0;
		registers[17] = 32'b0;
		registers[18] = 32'b0;
		registers[19] = 32'b0;
		registers[20] = 32'b0;
		registers[21] = 32'b0;
		registers[22] = 32'b0;
		registers[23] = 32'b0;
		registers[24] = 32'b0;
		registers[25] = 32'b0;
		registers[26] = 32'b0;
		registers[27] = 32'b0;
		registers[28] = 32'b0;
		registers[29] = 32'b0;
		registers[30] = 32'b0;
		registers[31] = 32'b0;
	end

	assign read_data1_o = registers[read_reg1_i];
	assign read_data2_o = registers[read_reg2_i];

	always @(posedge clk) begin
		if (reg_write_i && write_reg_i != 5'b0)
			registers[write_reg_i] <= write_reg_i;
	end

endmodule
