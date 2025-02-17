module universal_shift_register_tb();
  reg clk, reset;
  reg [1:0] ctrl;
  reg [3:0] d;
  wire [3:0] q;

  always #5 clk <= ~clk;

  initial begin
    clk <= 1'b0;
    reset <= 1'b1;
    d   <= 4'b0;
	ctrl <= 2'b0;
  end

  initial begin
    #4 reset <= 1'b0;
	d <= 4'b0110;
	ctrl <= 2'b11;

	#20
	ctrl <= 2'b01;

	#20
	ctrl <= 2'b01;

	#20
	ctrl <= 2'b10;

	#20
	ctrl <= 2'b00;
  end

  initial begin
    $display("reset\td\tq");
	$monitor(reset,"\t", d, "\t", q);
	#100 $finish;
  end

  universal_shift_register DUT(
	.clk(clk),
	.reset(reset),
	.ctrl(ctrl),
	.d(d),
	.q(q)
    );

  initial begin
    $dumpfile("universal_shift_register_tb.vcd");
    $dumpvars(0, universal_shift_register_tb);
  end

endmodule
