#include "fir.h"

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial your fir
	int Acc;
	int Temp;
	int Data;
	for (int i= 0; i < N-1; i++) {
		Acc = 0;
		Temp = inputsignal[i];
		for (int j = N - 1; j >= 0; j--) {
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
	//write down your fir
	return outputsignal;
}
		
