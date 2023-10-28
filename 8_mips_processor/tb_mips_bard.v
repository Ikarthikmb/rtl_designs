`include "mips_bard.v"

module assert;

  task assert;
    input reg condition;
    input reg [31:0] message;
    begin
      if (!condition) begin
        $display("Assertion failed: %s", message);
        // $stop;
      end
    end
  endtask;

endmodule

module tb_mips_bard;

  // The `assert` module is defined in the same file.

  // Instantiate the `mips_bard` module.
  mips_bard mips_bard (
    .clk(clk),
    .rst(rst),
    .instruction(instruction),
    .pc(pc),
    .data_out(data_out)
  );

  // Clock signal.
  reg clk;
  always #1 clk = ~clk;

  // Reset signal.
  reg rst;
  initial begin
    rst = 1;
    #10 rst = 0;
  end

  // Instruction signals.
  reg [31:0] instruction;
  initial begin
    instruction = 32'h10000000; // R-type instruction
    #10 instruction = 32'h20000000; // I-type instruction
    #10 instruction = 32'h30000000; // J-type instruction
  end

  // Expected outputs.
  reg [31:0] expected_pc;
  reg [31:0] expected_data_out;
  initial begin
    expected_pc = 32'h10000004;
    expected_data_out = 32'h0;
  end

  // Assert that the outputs match the expected values.
  assert(pc == expected_pc);
  assert(data_out == expected_data_out);

endmodule

