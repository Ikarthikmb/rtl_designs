module weighted_summation (
	input clock,
	input reset,
	input signed [31:0] sum_in,
	input [15:0] x_in,
	input [15:0] w_in,
	output signed [31:0] wsum_out
	);

	reg signed [31:0] wsum_out_reg;

    always @(posedge clock or posedge reset) begin
		if (reset)
			wsum_out_reg <= 32'b0;
		else
			wsum_out_reg <= sum_in + (x_in * w_in);
	end

	assign wsum_out = wsum_out_reg;

endmodule
