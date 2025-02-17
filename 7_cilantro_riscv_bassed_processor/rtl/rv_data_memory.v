module rv_data_memory (
    input clk,
    input [31:0] address, write_data,
    input mem_read, mem_write,
    output [31:0] read_data
);
    reg [31:0] mem [0:255]; // 256 words of data memory

    always @(posedge clk) begin
        if (mem_write)
            mem[address >> 2] <= write_data;
    end

    assign read_data = (mem_read) ? mem[address >> 2] : 32'b0;
endmodule

