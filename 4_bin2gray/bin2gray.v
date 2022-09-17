// Binary to Gray code conversion

module bin2gray #(
    parameter LEN = 2
) (
    input [LEN-1:0] i_bin,
    output reg [LEN-1:0] o_gray
    );

    reg [LEN-1:0] i = 0;

    assign o_gray[0] = i_bin[0] ^ i_bin[1];
    assign o_gray[1] = i_bin[1];

endmodule
