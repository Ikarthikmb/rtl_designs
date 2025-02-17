module rv_instr_mem(
	input [31:0] address,
	output [31:0] instruction
);
	reg [31:0] mem [0:255];
	
	intial begin
		if (rst)
			mem[0] <= 0;
		else
			mem[0] <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	end

	assign instruction = mem[address >> 2]

endmodule
