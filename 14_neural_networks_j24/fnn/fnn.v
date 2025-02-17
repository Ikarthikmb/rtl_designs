module fnn #(
    parameter INPUTS = 3,
    parameter HIDDEN_NEURONS = 4,
    parameter OUTPUTS = 2,
    parameter DATA_WIDTH = 16,
  )(
    input clk,
    input rst,
    input [INPUTS * DATA_WIDTH-1:0] input_vector,
    input [INPUTS * HIDDEN_NEURONS * DATA_WIDTH-1:0] weights_input_hidden,
    output [OUTPUTS * DATA_WIDTH-1:0] output_vector
  );

  always @(posedge clk or posedge rst) begin
    if (rst) begin
	  for(i=0; i<HIDDEN_NEURONS; i=i+1) begin
	    hidden_layer[i] <= 0;
	  end
	end else begin
	  for (j=0; j<HIDDEN_NEURONS; j=j+1) begin
	    hidden_layer[i] <= 0;
	    for (j=0; j<HIDDEN_NEURONS; j=j+1) begin
	      hidden_layer[i] <= hidden_layer[i] + input_vector[j*DATA_WIDTH+1:DATA_WIDTH] * weights_input_hidden[(i*INPUTS+j)*DATA_WIDTH:DATA_WIDTH];
	    end
	    // Activation
	    if (hidden_layer[i][DATA_WIDTH-1]) begin
	      hidden_layer[i] <= 0;
	    end
	  end
	end
  end

  reg [DATA_WIDTH-1:0] output_layer [OUTPUTS-1:0];

  always @(posedge clk or posedge rst) begin
    if (rst) begin
	  for (i=0; i<OUTPUTS; i=i+1) begin
	    output_layer[i] <= 0;
	  end
	end else begin
	  for (i=0; i<OUTPUTS; i=i+1) begin
	    output_layer[i] <=0; 
		for (j=0; j<HIDDEN_NEURONS; j=j+1) begin
		  output_layer[i] <= output_layer[i] + hidden_layer[j] * weights_input_hidden[(i*HIDDEN_NEURONS+j)*DATA_WIDTH+1:DATA_WIDTH];
		end
		// Activation
		if (output_layer[i][DATA_WIDTH-1]) begin
		  output_layer[i] <= 0;
		end
	  end
	end
  end

  genvar k;
  generate
    for (k=0; k<OUTPUTS; k=k+1) begin
	  assign output_vector[k*DATA_WIDTH+1:DATA_WIDTH] = output_layer[k];
	end
  endgenerate

endmodule
