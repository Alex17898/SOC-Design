#include "fir.h"
#include <defs.h>
#define reg_mprj_slave (*(volatile uint32_t*)0x30000000)

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial your fir

        reg_mprj_datal=0xA50000;
	for(int i=0;i<=10;i++){
	     reg_mprj_datal=0xAB600000;
	     reg_mprj_slave = taps[i];
 	}
 	reg_mprj_datal=0xAB600000;
	reg_mprj_slave = 64;
 	for(int n=0;n<64;n++){
 	  x[n]=n+1;
 	  reg_mprj_datal=0xAB600000;
	  reg_mprj_slave = x[n];
	  while(1){
	    if(reg_mprj_slave==expect[n]){
	      y[n]=expect[n];
	      reg_mprj_datal=0xAB610000;
	      break;
	    }
	  }
 	}
 	reg_mprj_datal=(0x005A0000|(y[63]<<24))&0xFFFF0000;
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();
	//write down your fir
	return y;
}
		
