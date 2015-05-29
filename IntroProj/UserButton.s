#include <ST/iostm32f207zx.h>

          NAME UserButton
          
          public USER_BUTTON_Init

          Section .userButton : CODE (2)
          THUMB
          
USER_BUTTON_Init

          LDR   R0, =RCC_AHB1ENR
          LDR   R1, [R0]
          ORR   R1, R1, #(1<<6)
          STR   R1, [R0]
          
          LDR.W R0, =GPIOG_MODER
          LDR   R1, [R0]
          BIC   R1, R1, #(3<<12)
          ORR   R1, R1, #(0<<12)
          STR   R1, [R0]
          
          BX    LR
          
          END