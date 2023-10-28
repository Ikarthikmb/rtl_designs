nco:
	iverilog -o nco.out nco.v 
	vvp nco.out

sim:
	iverilog -o nco_tb.out nco_tb.v nco.v 
	vvp nco_tb.out

clean:
	rm *vcd *out
