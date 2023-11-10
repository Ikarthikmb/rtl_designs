module relu(
	input clock,
	input reset,
	input signed [31:0] sum_in,
	output reg done,
	output signed [31:0] sum_out,
	output [31:0] relu_out
);

	reg [31:0] relu_out_reg;
	reg [31:0] sum_out_reg;

    always @(posedge clock or posedge reset) begin
		if (reset) begin
			relu_out_reg <=  32'b0;
			done <= 1'b0;
		end else begin
			sum_out_reg <= sum_in;
			if (sum_in < 0)
				relu_out_reg <=  32'b0;
			else begin
				relu_out_reg <=  sum_in;
				done <= 1'b1;
			end
		end
	end

	assign relu_out = relu_out_reg;
	assign sum_out = sum_out_reg;

endmodule
