# 0 "qsort.c"
# 1 "/home/ubuntu/caravel-soc_fpga-lab-main/Final/Final/lab-wlos_baseline/testbench/uart//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "qsort.c"
# 1 "qsort.h" 1




int C[10] = {893, 40, 3233, 4267, 2669, 2541, 9073, 6023, 5681, 4622};
# 2 "qsort.c" 2

int __attribute__ ( ( section ( ".mprjram" ) ) ) partition(int low,int hi){
 int pivot = C[hi];
 int i = low-1,j;
 int temp;
 for(j = low;j<hi;j++){
  if(C[j] < pivot){
   i = i+1;
   temp = C[i];
   C[i] = C[j];
   C[j] = temp;
  }
 }
 if(C[hi] < C[i+1]){
  temp = C[i+1];
  C[i+1] = C[hi];
  C[hi] = temp;
 }
 return i+1;
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) sort(int low, int hi){
 if(low < hi){
  int p = partition(low, hi);
  sort(low,p-1);
  sort(p+1,hi);
 }
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) qsort(){
 sort(0,10 -1);
 return C;
}
