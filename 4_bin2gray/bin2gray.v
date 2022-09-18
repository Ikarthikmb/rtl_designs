// Binary to Gray code conversion

module bin2gray #(
    parameter LEN = 4
) (
    input [LEN-1:0] i_bin,
    output [LEN-1:0] o_gray
    );

    reg [LEN-1:0] i = 0;

    genvar g;

    generate 
        if (LEN > 1) begin
            for (g=0; g<(LEN-1); g=g+1) begin
                simple_xor SXOR (.a_in(i_bin[g]),.b_in(i_bin[g+1]),.y_out(o_gray[g]));
            end
        end
    endgenerate

    assign o_gray[LEN-1] = i_bin[LEN-1];

endmodule

module simple_xor(
    input a_in,
    input b_in,
    output y_out
);
    assign y_out = a_in ^ b_in;
endmodule

