`include "pwm_top.v"

module tb_pwm;

  // Parameters
  parameter CLOCK_PERIOD = 10;  // Clock period in ns
  parameter SIM_DURATION = 1000; // Simulation duration in ns

  // Inputs
  reg clk;
  reg rst;
  reg [6:0] duty_cycle; // Using 7 bits to represent duty cycle from 0 to 100 (0 to 100%)
  reg [15:0] frequency; // Using 16 bits to represent frequency (in Hz)

  // Outputs
  wire pwm_out;

  // Instantiate the PWM Generator
  pwm_top pwm_gen (
    .clk(clk),
    .rst(rst),
    .duty_cycle(duty_cycle),
    .frequency(frequency),
    .pwm_out(pwm_out)
  );

  // Clock generation (50% duty cycle)
  always begin
    #(CLOCK_PERIOD/2) clk = ~clk;
  end

  // Initial values
  initial begin
    // Case 1
    clk = 0;
    rst = 1;
    duty_cycle = 25; // 25% duty cycle
    frequency = 2000; // 2 kHz frequency
    #20 rst = 0; // Release reset after 20 ns
    #50;
    // Case 2
    rst = 1;
    #5;
    duty_cycle = 65; // 25% duty cycle
    frequency = 2000; // 2 kHz frequency
    #20 rst = 0; // Release reset after 20 ns
    // Case 3
    rst = 1;
    #5;
    duty_cycle = 100; // 25% duty cycle
    frequency = 2000; // 2 kHz frequency
    #20 rst = 0; // Release reset after 20 ns
  end

  // Monitor statements
  initial @(posedge clk) begin
    $display("time\tclk\trst\tPWM");
    $monitor("[@%0t]", $time,"\t", clk,"\t", rst,"\t", pwm_out);
    // $monitor("[@%0t]", $time,"\t", clk,"\t", rst,"\t", pwm_out,"\t", duty_cycle, "\t", frequency);
  end

  initial begin
    $dumpfile("tb_pwm.vcd");
    #300;
    $finish;
    $dumpvars(0, tb_pwm);
  end

endmodule

