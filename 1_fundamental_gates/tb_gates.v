`include "gates.v"

module tb_gates();

    reg a_in;
    reg b_in;

    wire o_and;
    wire o_nand;
    wire o_or;
    wire o_nor;
    wire o_xor;
    wire o_xnor;
    wire o_inv;
    wire o_buf;

    integer i;

    and_gate AND_GATE(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(o_and)
    );

    nand_gate NAND_GATE(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(o_nand)
    );

    or_gate OR_GATE(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(o_or)
    );

    nor_gate NOR_GATE(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(o_nor)
    );

    xor_gate XOR_GATE(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(o_xor)
    );

    xnor_gate XNOR_GATE(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(o_xnor)
    );

    inverter INVERTER(
        .a_in(a_in),
        .y_out(o_inv)
    );

    buffer BUFFER(
        .a_in(a_in),
        .y_out(o_buf)
    );

    initial begin 
        $dumpfile("tb_gates.vcd");
        $dumpvars(0);
    end

    initial begin 
        a_in = 1'b0;
        b_in = 1'b0;
    end

    initial begin
        for (i=0;i<4;i=i+1) begin
            #10 {a_in,b_in} = i;
        end
    end

    initial begin
        $display("a_in\tb_in\to_and\to_nand\to_or\to_nor\to_xor\to_xnor\to_inv\to_buf");
        $monitor(a_in,"\t",b_in,"\t",o_and,"\t",o_nand,"\t",o_or,"\t",o_nor,"\t",o_xor,"\t",o_xnor,"\t",o_inv,"\t",o_buf);
        #40 $finish;
    end

endmodule // tb_gates
