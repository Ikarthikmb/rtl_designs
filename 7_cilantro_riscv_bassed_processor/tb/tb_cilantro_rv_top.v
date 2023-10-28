module tb_cilantro_rv_top;
    reg clk;
    reg rst;
    reg [31:0] instruction_in;
    wire [31:0] data_out;

    reg [32:0] memory [1023:0];

    // Instantiate DUT here
    cilantro_rv_top DUT(.clk(clk), .rst(rst), .instr_in(instruction_in), .data_out(data_out));

    // Testbench clock generation (for example, a 10ns clock period)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1; // Reset active high
        #10 rst = 0; // De-assert reset after 10 time units

        // Load a test program into memory (for example)
        memory[0] = 32'h00100013; // ADDI x0, x1, 1 (x0 = 0 + 1)
        memory[4] = 32'h00008067; // JALR x0, x1, 0 (jump to x1 + 0)
        memory[8] = 32'h00000013; // NOP (no operation)

        // Stimulus: Set instruction_in to the address of the first instruction
        instruction_in = 32'd0;
        #20 instruction_in = 32'd4;

        // Continue with other instructions as needed for testing

        #100;
        $finish;
    end

    initial begin
	    $dumpfile("tb_cilantro_rv_top.vcd");
	    $dumpvars(0, tb_cilantro_rv_top);
    end

    initial begin
	    $display("rst\tinstr\tout");
	    $monitor(rst,"\t",instruction_in,"\t",data_out);
    end
endmodule

