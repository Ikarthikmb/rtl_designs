module adder2bit #(
    parameter DW = 2
) (
    input [DW-1:0] a_in,
    input [DW-1:0] b_in,
    output [DW:0] o_sum
);

    reg r_c0;
    reg r_s1;

    assign o_sum[0] = a_in[0] ^ b_in[0];
    assign r_c0 = a_in[0] & b_in[0];

    assign r_s1 = a_in[1] ^ b_in[1];
    assign o_sum[1] = r_s1 ^ r_c0;
    assign o_sum[2] = a_in[1] & b_in[1];

endmodule
