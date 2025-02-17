module rv_control_unit (
    input [6:0] opcode,
    output reg reg_write, mem_read, mem_write, branch,
    output reg alu_src, mem_to_reg
);
    always @(*) begin
        case (opcode)
            7'b0110011: begin // R-Type
                reg_write = 1;
                alu_src = 0;
                mem_read = 0;
                mem_write = 0;
                branch = 0;
                mem_to_reg = 0;
            end
            7'b0000011: begin // Load
                reg_write = 1;
                alu_src = 1;
                mem_read = 1;
                mem_write = 0;
                branch = 0;
                mem_to_reg = 1;
            end
            7'b0100011: begin // Store
                reg_write = 0;
                alu_src = 1;
                mem_read = 0;
                mem_write = 1;
                branch = 0;
                mem_to_reg = 0;
            end
            7'b1100011: begin // Branch
                reg_write = 0;
                alu_src = 0;
                mem_read = 0;
                mem_write = 0;
                branch = 1;
                mem_to_reg = 0;
            end
            default: begin
                reg_write = 0;
                alu_src = 0;
                mem_read = 0;
                mem_write = 0;
                branch = 0;
                mem_to_reg = 0;
            end
        endcase
    end
endmodule
