#include <ST/iostm32f207zx.h>

        NAME    ext_trim
        
        PUBLIC EXT_TRIM_Init
        PUBLIC EXT_TRIM_Get_Counts
        
        SECTION .ext_trim : CODE (2)
        THUMB
        
EXT_TRIM_Init
        Push    {R0, R1, R2}
        
        LDR     R0, =RCC_AHB1ENR
        LDR     R1, [R0]
        ORR     R1, R1, #(1<<5)
        STR     R1, [R0]
        
        LDR     R0, =GPIOF_MODER
        LDR     R1, [R0]
        ORR     R1, R1, #(1<<6) | (1<<7)
        STR     R1, [R0]
        
        LDR     R0, =RCC_APB2ENR
        LDR     R2, [R0]
        ORR     R1, R2, #(1<<10)
        STR     R1, [R0]
        
        LDR     R0, =ADC3_CR2
        LDR     R1, [R0]
        ORR     R1, R1, #(1<<0)
        ORR     R1, R1, #(1<<1)
        STR     R1, [R0]
        
        LDR     R0, =ADC3_SQR3
        LDR     R1, [R0]
        ORR     R1, R1, #0x09
        STR     R1, [R0]
        
        POP {R0, R1, R2}
        
        BX LR
        
EXT_TRIM_Get_Counts
        PUSH    {R0, R1, R2}
        LDR     R0, =ADC3_CR2
        LDR     R1, [R0]
        ORR     R1, R1, #(1<<30)
        STR     R1, [R0]
        
        LDR     R2, =ADC3_DR
        LDR     R6, [R2]
        
        POP     {R0, R1, R2}
        BX      LR
        
        END