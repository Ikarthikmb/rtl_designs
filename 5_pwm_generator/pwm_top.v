// PWM Generator

`timescale 1ns/1ns

module pwm_top(
	input 	    	clk,
	input 	    	rst,
	input [6:0] 	duty_cycle,
	input [15:0] 	frequency,
	output reg 	pwm_out
);

real TIME_PERIOD, TON, TOFF;

always @(posedge clk) begin
	if (rst) begin
		pwm_out = 1'b0;
		$display("frep=%d, duty cycle=%d",frequency, duty_cycle);
		TIME_PERIOD = (10000/ frequency);
		$display("TP=%0t", TIME_PERIOD);
		TON = ((duty_cycle * TIME_PERIOD) / 100);
		TOFF = TIME_PERIOD - TON;
		$display("TON=%0t, TOFF=%0t", TON, TOFF);
	end else if (TON == TIME_PERIOD) begin 
		pwm_out = 1'b1;
	end else if (TOFF == TIME_PERIOD) begin 
		pwm_out = 1'b0;
	end else begin 
		pwm_out = 1'b1;
		#TON;
		pwm_out = 1'b0;
		#TOFF;
	end
end

endmodule
