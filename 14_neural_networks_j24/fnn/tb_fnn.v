module tb_fnn;
  parameter INPUTS = 3;
  parameter HIDDEN_NEURONS = 4;
  parameter OUTPUTS = 2;
  parameter DATA_WIDTH = 16;

  // Inputs
  reg clk;
  reg rst;
  reg [INPUTS*DATA_WIDTH-1:0] input_vector;
  reg [INPUTS*HIDDEN_NEURONS*DATA_WIDTH-1:0] weights_input_hidden;
  reg [HIDDEN_NEURONS*OUTPUTS*DATA_WIDTH-1:0] weights_hidden_output;

  // Outputs
  wire [OUTPUTS*DATA_WIDTH-1:0] output_vector;

  fnn #(
    .INPUTS(INPUTS),
	.HIDDEN_NEURONS(HIDDEN_NEURONS),
	.OUTPUTS(OUTPUT),
	.DATA_WIDTH(DATA_WIDTH)
  ) dut (
    .clk(clk),
	.rst(rst),
	.input_vector(input_vector),
	.weights_input_hidden(weights_input_hidden),
	.weights_hidden_output(weights_hidden_output),
	.output_vector(output_vector)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
  end

  initial begin
    rst = 1;
	input_vector = 0;
	weights_input_hidden = 0;
	weights_hidden_output = 0;

	#20;
	rst = 0;
	input_vector = {16'h0003, 16'h0002, 16'h0001};
	weights_input_hidden = {
	  16'h001, 16'h0002, 16'h0003, 16'h0004, 
	  16'h001, 16'h0002, 16'h0003, 16'h0004, 
	  16'h001, 16'h0002, 16'h0003, 16'h0004, 
	  16'h001, 16'h0002, 16'h0003, 16'h0004, 
	};
	weights_hidden_output = {
	  16'h001, 16'h0002, 16'h0003, 16'h0004, 
	  16'h001, 16'h0002, 16'h0003, 16'h0004, 
	};
	#100;
	input_vector = {16'h0004, 16'h0003, 16'h0002};
	#100;
	$stop;
  end
endmodule
