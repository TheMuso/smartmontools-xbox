#ifndef _BOOTHDDKEY_H_
#define _BOOTHDDKEY_H_


#include "BootEEPROM.h"

//void quick_SHA1( unsigned char *SHA1_result, ... );
void HMAC_SHA1(unsigned char *result,
               unsigned char *key, int key_length,
                unsigned char *text1, int text1_length,
                 unsigned char *text2, int text2_length );
void HMAC_SHA1_calculation(int version,unsigned char *HMAC_result, ... );
int copy_swap_trim(unsigned char *dst, unsigned char *src, int len);
int BootDecryptEEPROM(EEPROMDATA *eeprom);

#endif // _BOOTHDDKEY_H_
