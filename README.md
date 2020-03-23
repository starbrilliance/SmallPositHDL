This project needs a Chisel environment. Please ensure your
computer can run Chisel.

Platform requires:
```
-OS: Ubuntu 16.04
-Chisel: 3.2.0
-Scale: 2.12.10
-sbt: 1.3.2
-Verilator: 3.904
```

Type `make` to run this project. `posit.conf` controls the format of Posit.
The verilog codes are produced under `run/rtl` and wave files are produced
under `run/wave`.

Type `make xx_rtl` to produce verilog codes only or `make xx_wave` to 
produce wave files only. `xx` can be `add`, `mul`, `fma`, `ema`, `div`
and `q2p`.

```
add: adder
mul: multiplier
fma: FMA
ema: accumulator with quire
div: divider & square root extractor
q2p: quire to posit converter
```