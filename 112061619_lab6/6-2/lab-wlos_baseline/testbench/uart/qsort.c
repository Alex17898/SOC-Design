#include "qsort.h"

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
	sort(0,SIZE-1);
	return C;
}
