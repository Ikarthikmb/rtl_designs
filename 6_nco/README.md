# 8-bit Numerically Controlled Oscillator

An 8-bit NCO is a digital circuit that can generate both sine and cosine wave at a specific frequency.

1. Compile using Icarus Verilog

```
iverilog -o nco_tb.out nco_tb.v nco.v 
vvp nco_tb.out
```

2. To view the waveform use GTKwave viewer. Once you have the tool installed you can trigger it using the following command

```
gtkwave nco_tb.vcd
```

> Note:
> If you use a different compiler comment the below lines to avoid errors
> ```
> $dumpfile("nco_tb.vcd");
> $dumpvars(0, nco_tb);
> ```
