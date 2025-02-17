//////////////////////////////////////////// 
// SIMON 32/64
// Block size, 2n = 32 bits
// n-bit word  = 16 bits (x, y respectively)
// Key size = 64 bits --> w + n
// w = 2 words --> k0, k1
//////////////////////////////////////////// 

module top(
	input			clk,
	input			rst,
	input 	[31:0]	plaintext,
	input 	[63:0] 	key,
	input 	[4:0] 	rounds,
	output 	[63:0] 	ciphertext
	);
	
	reg [15:0] xplain, yplain;
	reg [63:0] k0, k1;
	initial begin
		xplain = plaintext[31:16];
		yplain = plaintext[15:0];
		k0 		= key[63:32];
		k1 		= key[32:0];
	end

	reg [15:0] 	xshift1, xshift8, non_linear_term, linear_term, round_function;
	reg [4:0]	round_counter;
	always @(posedge clk, rst) begin
		if (rst) begin
			xplain 	<= 'b0;
			yplain 	<= 'b0;
			k0 		<= 'b0;
			k1 		<= 'b0;
			round_counter	<= 'b0;
			ciphertext		<= 'b0;
		end else begin 
			if begin
				xplain 	<= plaintext[31:16];
				yplain 	<= plaintext[15:0];
				k0 		<= key[63:32];
				k1 		<= key[32:0];
				round_counter	<= 'b1;
			end else if (round_counter <= rounds) begin
				xshift1	<= {xplain[14:0], xplain[15]};
				xshift8 <= {xplain[7:0], xplain[15:8]};
				non_linear_term <= xshift1 & xshift8;
				linear_term <= {xplain[13:0], xplain[15:14]};
				round_function <= yplain ^ (non_linear_term ^ (linear_term ^ k));
				xplain <= yplain;
				yplain <= round_function;
				round_counter <= round_counter + 1;
			end
		end else begin
			ciphertext <= {xplain, yplain};
		end
	end

endmodule
