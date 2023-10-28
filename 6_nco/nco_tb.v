// Testbench for 8-bit NCO

module nco_tb;

  reg clk=0;
  reg reset;
  reg [7:0] phase_inc;
  
  wire [7:0] sine_out;
  wire [7:0] cosine_out;
  
  always #5 clk <= ~clk;
  
  nco DUT (
      .clk(clk),
      .reset(reset),
      .phase_inc(phase_inc),
      .sine_out(sine_out),
      .cosine_out(cosine_out)
  );
  
  initial begin
      clk <= 0;
      reset <= 1;
      #50 reset <= 0;
      phase_inc <= 8'h10;
  
      // Wait for 1000 clock cycles
      #500;
  end
  
  initial begin
  	$dumpfile("nco_tb.vcd");
  	$dumpvars(0, nco_tb);
    #500 $finish;
  end
  
  initial begin
  	$display("clk\trst\tphase\tsin\tcos");
  	$monitor(clk,"\t", reset,"\t", phase_inc,"\t", sine_out,"\t", cosine_out);
  end

endmodule

