# 0 "fir.c"
# 1 "/home/ubuntu/caravel-soc_fpga-lab-main/lab-exmem_fir/testbench/counter_la_fir//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "fir.c"
# 1 "fir.h" 1





int taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int inputbuffer[11];
int inputsignal[11] = {1,2,3,4,5,6,7,8,9,10,11};
int outputsignal[11];
# 2 "fir.c" 2

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {

 int Acc;
 int Temp;
 int Data;
 for (int i= 0; i < 11 -1; i++) {
  Acc = 0;
  Temp = inputsignal[i];
  for (int j = 11 - 1; j >= 0; j--) {
   if (j == 0) {
    inputbuffer[0] = Temp;
    Data = Temp;
   } else {
    inputbuffer[j] = inputbuffer[j - 1];
    Data = inputbuffer[j];
   }
   Acc += Data * taps[j];
  }
  outputsignal[i] = Acc;
 }
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
 initfir();

 return outputsignal;
}
