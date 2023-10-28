module mips_bard (
  input clk,
  input rst,
  input [31:0] instruction,
  output reg [31:0] pc,
  output reg [31:0] data_out
);

  // 32-bit instruction formats
  localparam R_TYPE = 6'h0;
  localparam I_TYPE = 6'h1;
  localparam J_TYPE = 6'h2;

  // Instruction decoder
  reg [5:0] instruction_type;
  always @(posedge clk) begin
    instruction_type <= instruction[31:26];
  end

  // Register file
  reg [31:0] regfile_packed;
  always @(posedge clk) begin
    if (rst) begin
      regfile_packed <= 32'h0;
    end else begin
      case (instruction_type)
        R_TYPE: begin
          regfile_packed[instruction[25:21]] <= instruction[16:0];
        end
        I_TYPE: begin
          regfile_packed[instruction[15:11]] <= instruction[20:0];
        end
        J_TYPE: begin
          pc <= instruction[25:0];
        end
      endcase
    end
  end

  // Output
  always @(posedge clk) begin
    data_out <= regfile_packed[instruction[25:21]];
  end

endmodule

