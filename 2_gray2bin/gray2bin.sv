// Gray to Binary converter

module gray2bin(
    input logic [3:0] i_gray,
    output logic [3:0] o_bin
);

    assign o_bin[3] = i_gray[3];
    assign o_bin[2] = (i_gray[3] & ~i_gray[2]) | (~i_gray[3] & i_gray[2]);
    assign o_bin[1] = (o_bin[2] & ~i_gray[1]) | (~o_bin[2] & i_gray[1]);
    assign o_bin[0] = (o_bin[1] & ~i_gray[0]) | (~o_bin[1] & i_gray[0]);

endmodule: gray2bin
