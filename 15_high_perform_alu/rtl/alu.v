// ALU 
// - The ALU consists of several main components, including the Operand A and Operand B inputs, Control Signals to specify the operation, Arithmetic Unit, Logic Unit, Barrel Shifter, Flags Generator, and the Result and Flags outputs.
// - Operand A and Operand B inputs are the two data operands that are operated on by the ALU.
// - Control Signals are used to select the desired operation to be performed by the ALU.
// - The Result output represents the result of the operation performed by the ALU.
// - The Flags output provides status flags that indicate the characteristics of the operation's result.

module alu(
	input [7:0] a_in,
	input [7:0] b_in,
	input [2:0] ctrl_in,
	output [7:0] results_out
);

	case (ctrl_in)

// Arthmetic Unit
// - The Arithmetic Unit performs arithmetic operations such as addition, subtraction, multiplication, and division.
	'b001; 	begin // addition
		results_out = a_in ^ b_in;
		carry_out = a_in & b_in;
		end
	'b010; 	begin // subtraction
		results_out = a_in ^ b_in;
		carry_out = a_in & b_in;
		end
	'b011; 	begin // multiplication
		results_out = a_in & b_in;
		carry_out = a_in & b_in;
		end
	'b011; 	begin // division
		results_out = a_in ^ b_in;
		carry_out = a_in & b_in;
		end

// Logic Unit
// - The Logic Unit handles logic operations such as AND, OR, and XOR.
	'b100; 	begin // AND
		results_out = a_in ^ b_in;
		carry_out = a_in & b_in;
		end
	'b101; 	begin // OR
		results_out = a_in ^ b_in;
		carry_out = a_in & b_in;
		end
	'b110; 	begin // XOR
		results_out = a_in ^ b_in;
		carry_out = a_in & b_in;
		end

// Barrel Shifter
// - The Barrel Shifter is responsible for shifting and rotating the bits of an operand by a specified number of positions.

// Flags Generator
// - The Flags Generator generates flags, such as carry, overflow, zero, negative, and parity, based on the result of the operation.

endmodule // alu
