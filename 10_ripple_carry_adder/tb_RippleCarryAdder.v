module tb_RippleCarryAdder();
  reg [3:0] A;
  reg [3:0] B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;

  initial begin
    A 	<= 'b0;
    B 	<= 'b0;
    Cin <= 'b0;
  end

  integer i;

  initial begin
    for (i=0; i<4; i=i+1) begin
	  A <= $random % 8;
	  B <= $random % 8;
	  #10;
	end
	#10;
	A <= 3'b111;
	B <= 3'b101;
  end

  initial begin
    $display("A\tB\tCin\tSum\tCout");
	$monitor(A,"\t",B,"\t",Cin,"\t",Sum,"\t",Cout);
	#100 $finish;
  end

  RippleCarryAdder RCA(
    .A(A),
	.B(B),
	.Cin(Cin),
	.Sum(Sum)
	.Cout(Cout)
	);

endmodule
