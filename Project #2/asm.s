#include <ST/iostm32f207zx.h>
#include <lcd.h>
#include <TIMERS.h>
#include <font13.h>
#include <ext_trim.h>

	NAME    main
        
        PUBLIC  __iar_program_start		;DECLARES START OF PROG
        PUBLIC  __vector_table			;DECLARES PUBLIC VECTOR TABLE
	
	SECTION CSTACK : DATA : NOROOT(3)

        SECTION .intvec : CODE : NOROOT(2)		
        DATA
	
__vector_table
        DCD     sfe(CSTACK)			;STACK POINTER INITIALIZER
        DCD     __iar_program_start		;RESET HANDLER
        
__iar_program_start
        B       main

        SECTION .text : CODE (2)
        THUMB
main

        BL LCD_Init
        BL EXT_TRIM_Init
wait
        BL EXT_TRIM_Get_Counts
        
        MOV     R0, #128
        MOV     R1, #0
        LDR     R2, =BLACK
        LDR     R3, =WHITE
        LDR     R4, =FONT_13
print
        MOV R9, #10
        UDIV R10, R8, R9
        MUL R11, R10, R9
        SUB R12, R8, R11
     
        ADD R12, R12, #0x30
        
        MOV     R5, R12
        
        BL LCD_WriteCharacter
        
        SUB     R0, R0, #10
        CMP     R10, #0
        BEQ wait
        
        B print
        
        B wait
   

        END
