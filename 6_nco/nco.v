// 8-bit Numerically Controlled Oscillator

module nco (
  clk,
  reset,
  phase_inc,
  sine_out,
  cosine_out
  );

  parameter PI = 3.14159265358979323846;
  
  
  input clk;
  input reset;
  input [7:0] phase_inc;
  
  output [7:0] sine_out;
  output [7:0] cosine_out;
  
  reg [7:0] phase;
  
  always @(posedge clk) begin
      if (reset)
          phase <= 0;
      else if (!reset)
          phase <= phase + phase_inc;
  	else
          phase <= 8'bz;
  end
  
  reg [7:0] sine_lookup [255:0];
  reg [7:0] cosine_lookup [255:0];
  integer i;
  
  // Initializing lookup tables
  initial begin
      for (i = 0; i < 256; i = i + 1) begin
          sine_lookup[i] = 127 * $sin(2 * PI * i / 256);
          cosine_lookup[i] = 127 * $cos(2 * PI * i / 256);
      end
  end
  
  // Outputs
  assign sine_out = sine_lookup[phase[7:0]];
  assign cosine_out = cosine_lookup[phase[7:0]];

endmodule

