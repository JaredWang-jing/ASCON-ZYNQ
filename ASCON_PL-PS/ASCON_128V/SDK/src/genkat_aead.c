//
// NIST-developed software is provided by NIST as a public service.
// You may use, copy and distribute copies of the software in any medium,
// provided that you keep intact this entire notice. You may improve,
// modify and create derivative works of the software or any portion of
// the software, and you may copy and distribute such modifications or
// works. Modified works should carry a notice stating that you changed
// the software and should note the date and nature of any such change.
// Please explicitly acknowledge the National Institute of Standards and
// Technology as the source of the software.
//
// NIST-developed software is expressly provided "AS IS." NIST MAKES NO
// WARRANTY OF ANY KIND, EXPRESS, IMPLIED, IN FACT OR ARISING BY OPERATION
// OF LAW, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTY OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT AND DATA
// ACCURACY. NIST NEITHER REPRESENTS NOR WARRANTS THAT THE OPERATION OF THE
// SOFTWARE WILL BE UNINTERRUPTED OR ERROR-FREE, OR THAT ANY DEFECTS WILL BE
// CORRECTED. NIST DOES NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE
// USE OF THE SOFTWARE OR THE RESULTS THEREOF, INCLUDING BUT NOT LIMITED TO THE
// CORRECTNESS, ACCURACY, RELIABILITY, OR USEFULNESS OF THE SOFTWARE.
//
// You are solely responsible for determining the appropriateness of using and
// distributing the software and you assume all risks associated with its use,
// including but not limited to the risks and costs of program errors,
// compliance with applicable laws, damage to or loss of data, programs or
// equipment, and the unavailability or interruption of operation. This software
// is not intended to be used in any situation where a failure could cause risk
// of injury or damage to property. The software developed by NIST employees is
// not subject to copyright protection within the United States.
//

// disable deprecation for sprintf and fopen
#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <inttypes.h>
#include <stdio.h>
#include <string.h>
#include "xil_printf.h"

#include "api.h"
#include "crypto_aead.h"
#include "xtime_l.h"

#define KAT_SUCCESS 0
#define KAT_FILE_OPEN_ERROR -1
#define KAT_DATA_ERROR -3
#define KAT_CRYPTO_FAILURE -4

#define MAX_FILE_NAME 256
#define MAX_MESSAGE_LENGTH 32
#define MAX_ASSOCIATED_DATA_LENGTH 32

void init_buffer(unsigned char *buffer, unsigned long long numbytes);


void fprint_bstr( const char *label, const unsigned char *data,
                 unsigned long long length);

int generate_test_vectors();

int main()
{

  int ret = generate_test_vectors();

  if (ret != KAT_SUCCESS)
  {
    xil_printf( "test vector generation failed with code %d\n", ret);
  }
  return ret;
}

int generate_test_vectors()
{
  XTime time_begin1, time_end1;
  u32 time_cost1;
  XTime time_begin2, time_end2;
  u32 time_cost2;

  unsigned char key[CRYPTO_KEYBYTES];
  unsigned char nonce[CRYPTO_NPUBBYTES];
  unsigned char msg[MAX_MESSAGE_LENGTH];
  unsigned char msg2[MAX_MESSAGE_LENGTH];
  unsigned char ad[MAX_ASSOCIATED_DATA_LENGTH];
  unsigned char ct[MAX_MESSAGE_LENGTH + CRYPTO_ABYTES];
  unsigned long long clen;
  unsigned long long mlen2;
  int count = 1;
  int func_ret, ret_val = KAT_SUCCESS;
  int ENC_number1=0;
  u32 *time_use1[1089];
  int i=1;
  u32 sum1=0;

  int ENC_number2=0;
  u32 *time_use2[1089];
  int j=1;
  u32 sum2=0;

  init_buffer(key, sizeof(key));
  init_buffer(nonce, sizeof(nonce));
  init_buffer(msg, sizeof(msg));
  init_buffer(ad, sizeof(ad));
  init_buffer(ct,sizeof(ct));
  xil_printf("hello world!!!!\n");

  xil_printf("LWC_AEAD_KAT_%d_%d.txt\n", (CRYPTO_KEYBYTES * 8),(CRYPTO_NPUBBYTES * 8));

for (unsigned long long mlen = 0;
      (mlen <= MAX_MESSAGE_LENGTH) && (ret_val == KAT_SUCCESS); mlen++)
 {
   for (unsigned long long adlen = 0; adlen <= MAX_ASSOCIATED_DATA_LENGTH;
        adlen++) 
		{
       xil_printf("Count = %d\n", count++);
       fprint_bstr( "Key = ", key, CRYPTO_KEYBYTES);
       fprint_bstr("Nonce = ", nonce, CRYPTO_NPUBBYTES);
       fprint_bstr("msg = ", msg, mlen);
       fprint_bstr("AD = ", ad, adlen);

       XTime_GetTime(&time_begin1);
     if ((func_ret = crypto_aead_encrypt(ct, &clen, msg, mlen, ad, adlen, NULL,
                                         nonce, key)) != 0) 
	{
         xil_printf( "crypto_aead_encrypt returned %d\n", func_ret);
       ret_val = KAT_CRYPTO_FAILURE;
       break;
    }
     XTime_GetTime(&time_end1);
     time_cost1=((time_end1-time_begin1)*1000000/(COUNTS_PER_SECOND));
     xil_printf("????????????%d\n",time_cost1);
//     fprint_bstr( "CT = ", ct, clen);



     XTime_GetTime(&time_begin2);
     if ((func_ret = crypto_aead_decrypt(msg2, &mlen2, NULL, ct, clen, ad,
                                         adlen, nonce, key)) != 0) 
	{
       xil_printf("crypto_aead_decrypt returned <%d>\n", func_ret);
       ret_val = KAT_CRYPTO_FAILURE;
       break;
     }
       XTime_GetTime(&time_end2);
       time_cost2=(time_end2-time_begin2)*1000000/COUNTS_PER_SECOND;
       xil_printf("????????????%d\n",time_cost2);
//       fprint_bstr( "PT = ", msg2, mlen2);



//     if (mlen != mlen2)
//	{
//         xil_printf(
//            "crypto_aead_decrypt returned bad 'mlen': Got <%" PRIu64
//            ">, expected <%" PRIu64 ">\n",
//            (uint64_t)mlen2, (uint64_t)mlen);
//       ret_val = KAT_CRYPTO_FAILURE;
//       break;
//    }
//
//
//     if (memcmp(msg, msg2, mlen))
//	 {
//       xil_printf( "crypto_aead_decrypt did not recover the plaintext\n");
//       ret_val = KAT_CRYPTO_FAILURE;
//       break;
//     }
     
     
    ENC_number1=i+ENC_number1;
    time_use1[ENC_number1] = &time_cost1;
    xil_printf("??%d????????????%d\n",ENC_number1,*time_use1[ENC_number1]);
    sum1=sum1+*time_use1[ENC_number1];



    ENC_number2=j+ENC_number2;
    time_use2[ENC_number2]=&time_cost2;
    xil_printf("??%d????????????%d\n",ENC_number2,*time_use2[ENC_number2]);
    sum2=sum2+*time_use2[ENC_number2];
    xil_printf("\n");
   }
 }
xil_printf("??????????%d\n",sum1);
xil_printf("??????????%d\n",sum2);
return ret_val;
}

void fprint_bstr( const char *label, const unsigned char *data,
                 unsigned long long length) {
  xil_printf( "%s", label);
  for (unsigned long long i = 0; i < length; i++)
      xil_printf("%02X", data[i]);
  xil_printf( "\n");
}


void init_buffer(unsigned char *buffer, unsigned long long numbytes) {
  for (unsigned long long i = 0; i < numbytes; i++)
    buffer[i] = (unsigned char)i;
}


