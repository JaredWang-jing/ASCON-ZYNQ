#include "api.h"
#include "ascon.h"
#include "crypto_aead.h"
#include "permutations.h"
#include "printstate.h"
#include "word.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_types.h"
#include "xil_printf.h"


#define XPAR_MYIP_BASEADDR XPAR_ASCON_128AV_TRY2_0_S00_AXI_BASEADDR

int crypto_aead_decrypt(unsigned char* m, unsigned long long* mlen,
                        unsigned char* nsec, const unsigned char* c,
                        unsigned long long clen, const unsigned char* ad,
                        unsigned long long adlen, const unsigned char* npub,
                        const unsigned char* k) {
  (void)nsec;

  if (clen < CRYPTO_ABYTES) return -1;

  /* set plaintext size */
  *mlen = clen - CRYPTO_ABYTES;

  Xil_Out32(XPAR_MYIP_BASEADDR+16,0x0);
  Xil_Out32(XPAR_MYIP_BASEADDR+20,clen);






//    //串口输出结果，便于查验查验正确性
//      state_p *pt;
//
//        pt->p1=Xil_In32(XPAR_MYIP_BASEADDR+48);
//      	   xil_printf("p0: %lx\n",pt->p1);
//
//        pt->p0=Xil_In32(XPAR_MYIP_BASEADDR+52);
//      	   xil_printf("p1: %lx\n",pt->p0);
//
//        pt->p3=Xil_In32(XPAR_MYIP_BASEADDR+56);
//      	   xil_printf("p2: %lx\n",pt->p3);
//
//        pt->p2=Xil_In32(XPAR_MYIP_BASEADDR+60);
//      	   xil_printf("p3: %lx\n",pt->p2);
//
//        pt->p5=Xil_In32(XPAR_MYIP_BASEADDR+64);
//      	   xil_printf("p4: %lx\n",pt->p5);
//
//        pt->p4=Xil_In32(XPAR_MYIP_BASEADDR+68);
//      	   xil_printf("p5: %lx\n",pt->p4);
//
//        pt->p7=Xil_In32(XPAR_MYIP_BASEADDR+72);
//      	   xil_printf("p6: %lx\n",pt->p7);
//
//        pt->p6=Xil_In32(XPAR_MYIP_BASEADDR+76);
//      	   xil_printf("p7: %lx\n",pt->p6);








   //用于测试时间，不输出结果
        state_p *pt;

          pt->p1=Xil_In32(XPAR_MYIP_BASEADDR+48);
          pt->p0=Xil_In32(XPAR_MYIP_BASEADDR+52);
          pt->p3=Xil_In32(XPAR_MYIP_BASEADDR+56);
          pt->p2=Xil_In32(XPAR_MYIP_BASEADDR+60);
          pt->p5=Xil_In32(XPAR_MYIP_BASEADDR+64);
          pt->p4=Xil_In32(XPAR_MYIP_BASEADDR+68);
          pt->p7=Xil_In32(XPAR_MYIP_BASEADDR+72);
          pt->p6=Xil_In32(XPAR_MYIP_BASEADDR+76);













  	  return 0;
}
