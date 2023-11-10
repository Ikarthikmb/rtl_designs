neuron_unit:
	iverilog -o neuron_unit.out neuron_unit.v weighted_summation.v relu.v
	vvp neuron_unit.out

sim:
	iverilog -o neuronunit_tb.out neuronunit_tb.v neuron_unit.v weighted_summation.v relu.v
	vvp neuronunit_tb.out

clean:
	rm *vcd *out
