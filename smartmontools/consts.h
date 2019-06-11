#ifndef _CONSTS_H_
#define _CONSTS_H_

typedef unsigned char BYTE;
#define MAXFILENAME 1024
#define true 1
#define false 0

#ifndef NULL
#define NULL ((void *)0)
#endif

typedef unsigned int DWORD;
typedef unsigned short WORD;

#define GEN_CONFIG              0   /* general configuration */
#define INTEGRITY               255 /* integrity word */

#define SECU_STATUS             128 /* security status */
                                    /* time to complete security erase */
#define ERASE_TIME              89  /*   - ordinary */
#define ENH_ERASE_TIME          90  /*   - enhanced */

/* words 89, 90, SECU ERASE TIME */
#define ERASE_BITS              0x00ff

#define PSWD_CODE               92  /* master password revision code    */

/* word 128: security */
#define SECU_ENABLED    0x0002
#define SECU_LEVEL              0x0010
#define NUM_SECU_STR    6

#define NOVAL_0                 0x0000
#define NOVAL_1                 0xffff

//Important ATA IDENTIFY Data Structure values
////As per ATA Spec
#define IDE_SECURITY_SUPPORTED                  0x0001
#define IDE_SECURITY_ENABLED                    0x0002
#define IDE_SECURITY_PASSWORD_SET               0x0004
#define IDE_SECURITY_FROZEN                     0x0008
#define IDE_SECURITY_COUNT_EXPIRED              0x0010
#define IDE_SECURITY_LEVEL_MAX                  0x0100


#define HDD_SERIAL_OFFSET		0x014
#define HDD_MODEL_OFFSET		0x036
#define HDD_SECURITY_STATUS_OFFSET	0x100


#endif //_CONSTS_H_
