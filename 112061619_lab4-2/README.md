# Soc-Lab4-2
## the content of the work
.hex:將firmware轉成組合語言

fir.h:定義tap和x[n]

fir.c: Controller來控制wishbone和決定user_project的行為以及接收y[n]

bram.v:存機器語言

2個bram11.v:存tap以及x[n]

user_proj_example.counter.v:接收訊號且利用AXI-Lite和AXI-Stream及WB-interface來進行FIR的運算

## Execute FIR code in user BRAM

### Simulation for FIR
```sh
cd ~/caravel-soc_fpga-lab/lab-caravel_fir/testbench/counter_la_fir
source run_clean
source run_sim
```
