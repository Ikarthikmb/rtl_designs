module universal_shift_register(
  input clk, reset, 
  input [1:0] ctrl,
  input [3:0] d,
  output [3:0] q
  );

  reg [3:0] r_next, r_reg;

  always @(posedge clk) begin
    if (reset) begin
	  r_reg <= 2'b00;
	end else begin
	  r_reg <= r_next;
	end
  end

  always @(posedge clk) begin
    case (ctrl)
	  2'b00: r_next <= r_reg;
	  2'b01: r_next <= r_reg << 1;
	  2'b10: r_next <= r_reg >> 1;
	  2'b11: r_next <= d;
	  default: r_next <= r_reg;
	endcase
  end

  assign q = r_reg;

endmodule
