////////////////////////////////////////////////
// AND
////////////////////////////////////////////////

module gates(
    input a_in,
    input b_in,
    output y_out
);

    and_gate AND(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(y_out)
        );
    nand_gate NAND(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(y_out)
        );
    or_gate OR(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(y_out)
        );
    nor_gate NOR(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(y_out)
        );
    xor_gate XOR(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(y_out)
        );
    xnor_gate XNOR(
        .a_in(a_in),
        .b_in(b_in),
        .y_out(y_out)
        );
    inverter INVERTER(
        .a_in(a_in),
        .y_out(y_out)
        );
    buffer BUFFER( 
        .a_in(a_in),
        .y_out(y_out)
        );
endmodule

module and_gate(
    input a_in,
    input b_in,
    output y_out
);
    assign y_out = a_in & b_in;
endmodule // AND

////////////////////////////////////////////////
// NAND
////////////////////////////////////////////////

module nand_gate(
    input a_in,
    input b_in,
    output y_out
);
    assign y_out = ~(a_in & b_in);
endmodule // NAND

////////////////////////////////////////////////
// OR
////////////////////////////////////////////////

module or_gate(
    input a_in,
    input b_in,
    output y_out
);
    assign y_out = a_in | b_in;
endmodule // OR

////////////////////////////////////////////////
// NOR
////////////////////////////////////////////////

module nor_gate(
    input a_in,
    input b_in,
    output y_out
);
    assign y_out = ~(a_in | b_in);
endmodule // NOR

////////////////////////////////////////////////
// XOR
////////////////////////////////////////////////

module xor_gate(
    input a_in,
    input b_in,
    output y_out
);
    assign y_out = (a_in & ~b_in) | (~a_in & b_in);
endmodule // XOR

////////////////////////////////////////////////
// XNOR
////////////////////////////////////////////////

module xnor_gate(
    input a_in,
    input b_in,
    output y_out
);
    assign y_out = ~((a_in & ~b_in) | (~a_in & b_in));
endmodule // XNOR

////////////////////////////////////////////////
// INVERTER
////////////////////////////////////////////////

module inverter(
    input a_in,
    output y_out
);
    assign y_out = ~a_in;
endmodule // INVERTER

////////////////////////////////////////////////
// BUFFER
////////////////////////////////////////////////

module buffer(
    input a_in,
    output y_out
);
    assign y_out = ~a_in;
endmodule // BUFFER
