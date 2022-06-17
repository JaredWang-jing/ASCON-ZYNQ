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

int crypto_aead_encrypt(unsigned char* c, unsigned long long* clen,
                        const unsigned char* m, unsigned long long mlen,
                        const unsigned char* ad, unsigned long long adlen,
                        const unsigned char* nsec, const unsigned char* npub,
                        const unsigned char* k) {
  (void)nsec;

  /* set ciphertext size */
  *clen = mlen + CRYPTO_ABYTES;

  //传输初始化的结果，
   Xil_Out32(XPAR_MYIP_BASEADDR+0 ,0x0);
   Xil_Out32(XPAR_MYIP_BASEADDR+4 ,adlen);
   Xil_Out32(XPAR_MYIP_BASEADDR+8,0x0);
   Xil_Out32(XPAR_MYIP_BASEADDR+12,mlen);
 //  Xil_Out32(XPAR_MYIP_BASEADDR+20,0x0);
 //  Xil_Out32(XPAR_MYIP_BASEADDR+24,clen);










// //串口输出结果，便于查看
//    state_ct *ct;
//
//      ct->ct1=Xil_In32(XPAR_MYIP_BASEADDR+0);
//    	   xil_printf("ct0: %lx\n",ct->ct1);
//
//      ct->ct0=Xil_In32(XPAR_MYIP_BASEADDR+4);
//    	   xil_printf("ct1: %lx\n",ct->ct0);
//
//      ct->ct3=Xil_In32(XPAR_MYIP_BASEADDR+8);
//    	   xil_printf("ct2: %lx\n",ct->ct3);
//
//      ct->ct2=Xil_In32(XPAR_MYIP_BASEADDR+12);
//    	   xil_printf("ct3: %lx\n",ct->ct2);
//
//      ct->ct5=Xil_In32(XPAR_MYIP_BASEADDR+16);
//    	   xil_printf("ct4: %lx\n", ct->ct5);
//
//      ct->ct4=Xil_In32(XPAR_MYIP_BASEADDR+20);
//    	   xil_printf("ct5: %lx\n",ct->ct4);
//
//      ct->ct7=Xil_In32(XPAR_MYIP_BASEADDR+24);
//    	   xil_printf("ct6: %lx\n",ct->ct7);
//
//      ct->ct6=Xil_In32(XPAR_MYIP_BASEADDR+28);
//    	   xil_printf("ct7: %lx\n",ct->ct6);
//
//      ct->ct9=Xil_In32(XPAR_MYIP_BASEADDR+32);
//    	   xil_printf("ct8: %lx\n",ct->ct9);
//
//      ct->ct8=Xil_In32(XPAR_MYIP_BASEADDR+36);
//     	   xil_printf("ct9: %lx\n",ct->ct8);
//
//      ct->ct11=Xil_In32(XPAR_MYIP_BASEADDR+40);
//     	   xil_printf("ct10: %lx\n",ct->ct11);
//
//      ct->ct10=Xil_In32(XPAR_MYIP_BASEADDR+44);
//     	   xil_printf("ct11: %lx\n",ct->ct10);



   //用于测试时间，不在用串口输出结果
      state_ct *ct;

        ct->ct1=Xil_In32(XPAR_MYIP_BASEADDR+0);
        ct->ct0=Xil_In32(XPAR_MYIP_BASEADDR+4);
        ct->ct3=Xil_In32(XPAR_MYIP_BASEADDR+8);
        ct->ct2=Xil_In32(XPAR_MYIP_BASEADDR+12);
        ct->ct5=Xil_In32(XPAR_MYIP_BASEADDR+16);
        ct->ct4=Xil_In32(XPAR_MYIP_BASEADDR+20);
        ct->ct7=Xil_In32(XPAR_MYIP_BASEADDR+24);
        ct->ct6=Xil_In32(XPAR_MYIP_BASEADDR+28);
        ct->ct9=Xil_In32(XPAR_MYIP_BASEADDR+32);
        ct->ct8=Xil_In32(XPAR_MYIP_BASEADDR+36);
        ct->ct11=Xil_In32(XPAR_MYIP_BASEADDR+40);
        ct->ct10=Xil_In32(XPAR_MYIP_BASEADDR+44);










    return 0;
}
