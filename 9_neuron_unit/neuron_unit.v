module neuron_unit(
   input clock,
    input reset,
    input [15:0] x0, x1, x2, x3,
    input [15:0] w0, w1, w2, w3,
    input signed [15:0] bias,
    output signed [31:0] sum,
    output signed [31:0] out
);

	wire [31:0] sum_reg;
	wire signed [31:0] wsum_out0, wsum_out1, wsum_out2, wsum_out3, wsum_out;
	wire [31:0] relu_out_reg;

    weighted_summation WS0 (
		.clock(clock),
		.reset(reset),
		.sum_in({{16{bias[15]}},bias}),
		.x_in(16'b0),
		.w_in(16'b0),
		.wsum_out(sum_reg)
	); 

    weighted_summation WS1 (
		.clock(clock),
		.reset(reset),
		.sum_in(sum_reg),
		.x_in(x0),
		.w_in(w0),
		.wsum_out(wsum_out0)
	);

    weighted_summation WS2 (
		.clock(clock),
		.reset(reset),
		.sum_in(wsum_out0),
		.x_in(x1),
		.w_in(w1),
		.wsum_out(wsum_out1)
	);

    weighted_summation WS3 (
		.clock(clock),
		.reset(reset),
		.sum_in(wsum_out1),
		.x_in(x2),
		.w_in(w2),
		.wsum_out(wsum_out2)
	);

    weighted_summation WS4 (
		.clock(clock),
		.reset(reset),
		.sum_in(wsum_out2),
		.x_in(x3),
		.w_in(w3),
		.wsum_out(wsum_out3)
	);

	relu RLU (
		.clock(clock),
		.reset(reset),
		.sum_in(wsum_out3),
		.done(done),
		.sum_out(wsum_out),
		.relu_out(relu_out_reg)
	);

	assign sum = (done) ? wsum_out : 32'b0;
	assign out = (done) ? relu_out_reg : 32'b0;

endmodule
