module neuronunit_tb;

    // Declare the signals
    reg clock;
    reg reset;
    reg [15:0] x0, x1, x2, x3;        // Input values
    reg [15:0] w0, w1, w2, w3;        // Weight values
    reg signed [15:0] bias;           // Bias value (signed)
    wire [31:0] sum;                  // Summation output
    wire [31:0] out;                  // Neuron output

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // Instantiate the neuron
    neuron_unit UUT (
        .clock(clock),
        .reset(reset),
        .x0(x0), .x1(x1), .x2(x2), .x3(x3),
        .w0(w0), .w1(w1), .w2(w2), .w3(w3),
        .bias(bias),
        .sum(sum),
        .out(out)
    );

    initial begin
        // Reset the design
        reset = 1;
        x0 = 0; x1 = 0; x2 = 0; x3 = 0;
        w0 = 0; w1 = 0; w2 = 0; w3 = 0;
        bias = 0;
        #15;     // Wait for three clock cycles
        reset = 0;

		// Test case 1
		x0 = 4'd1; x1 = 4'd2; x2 = 4'd3; x3 = 4'd4;
		w0 = 4'd2; w1 = 4'd3; w2 = 4'd4; w3 = 4'd5;
		bias = 6'd50; // Positive bias for this test case
		#60; // Wait for 6 clock cycles for update

		// Check output
		$display("X0 = %d, X1 = %d, X2 = %d, X3 = %d", x0, x1,x2,x3);
		$display("W0 = %d, W1 = %d, W2 = %d, W3 = %d", w0,w1,w2,w3);
		if (sum[31]) 
			$display("Test 1: Sum = -%d, bias = %d, Output = %d", (~sum)+1, bias, out);
		else
			$display("Test 1: Sum = %d, bias = %d, Output = %d", sum, bias, out);
		$display("");


		// Test case 2
		x0 = 4'd1; x1 = 4'd2; x2 = 4'd3; x3 = 4'd4;
		w0 = 4'd2; w1 = 4'd3; w2 = 4'd4; w3 = 4'd5;
		bias = -6'd50; // Negative bias for this test case
		#60; // Wait for 6 clock cycles for update

		// Check output
		$display("X0 = %d, X1 = %d, X2 = %d, X3 = %d", x0, x1,x2,x3);
		$display("W0 = %d, W1 = %d, W2 = %d, W3 = %d", w0,w1,w2,w3);
		if (sum[31]) 
			$display("Test 2: Sum = -%d, bias = %d, Output = %d", (~sum)+1, bias, out);
		else
			$display("Test 2: Sum = %d, bias = %d, Output = %d", sum, bias, out);
		$display("");
        
		// Test case 3
		x0 = 4'd1; x1 = 4'd2; x2 = 4'd3; x3 = 4'd4;
		w0 = 4'd2; w1 = 4'd3; w2 = 4'd4; w3 = 4'd5;
		bias = $random; // Positive random bias for this test case
		#60; // Wait for 6 clock cycles for update

		// Check output
		$display("X0 = %d, X1 = %d, X2 = %d, X3 = %d", x0, x1,x2,x3);
		$display("W0 = %d, W1 = %d, W2 = %d, W3 = %d", w0,w1,w2,w3);
		if (sum[31]) 
			$display("Test 3: Sum = -%d, bias = %d, Output = %d", (~sum)+1, bias, out);
		else
			$display("Test 3: Sum = %d, bias = %d, Output = %d", sum, bias, out);
		$display("");
        
		// Test case 4
		x0 = 4'd1; x1 = 4'd2; x2 = 4'd3; x3 = 4'd4;
		w0 = 4'd2; w1 = 4'd3; w2 = 4'd4; w3 = 4'd5;
		bias = -$random; // Negative bias for this test case
		#60; // Wait for 6 clock cycles for update

		// Check output
		$display("X0 = %d, X1 = %d, X2 = %d, X3 = %d", x0, x1,x2,x3);
		$display("W0 = %d, W1 = %d, W2 = %d, W3 = %d", w0,w1,w2,w3);
		if (sum[31]) 
			$display("Test 4: Sum = -%d, bias = %d, Output = %d", (~sum)+1, bias, out);
		else
			$display("Test 4: Sum = %d, bias = %d, Output = %d", sum, bias, out);

    end

	initial begin
		$dumpfile("neuronunit_tb.vcd");
		$dumpvars(0,neuronunit_tb);
        #100 $finish;
	end

endmodule
