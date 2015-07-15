#include <ST/iostm32f207zx.h>
#include <lcd.h>
#include <TIMERS.h>
#include <ext_trim.h>

	NAME    main
        
        PUBLIC  __iar_program_start		;DECLARES START OF PROG
        PUBLIC  __vector_table			;DECLARES PUBLIC VECTOR TABLE
        PUBLIC  __iar_data_init3
        
        EXTERN FONT_13
	SECTION CSTACK : DATA : NOROOT(3)

        SECTION .intvec : CODE : NOROOT(2)		
        DATA
        
__vector_table
        DCD     sfe(CSTACK)			;STACK POINTER INITIALIZER
        DCD     __iar_program_start		;RESET HANDLER

__iar_program_start
        B       main

        SECTION .vars : DATA (2)
        DATA
        
string 
        DC8 "0000"


        SECTION .text : CODE (2)
        THUMB
        
__iar_data_init3
        BX LR
        
main

        BL LCD_Init
        BL EXT_TRIM_Init
wait
        BL EXT_TRIM_Get_Counts    ;COUNT IS IN R6
   
        MOV     R0, #10
        MOV     R1, #10
        LDR     R2, =BLACK
        LDR     R3, =WHITE
        LDR     R4, =FONT_13

        MOV     R7, #16
        UDIV    R8, R6, R7
        MUL     R9, R8, R7
        SUB     R10, R6, R9
        MOV     R6, R8
        
        LDR     R11, =string
        ADD     R10, R10, #0x41
        STRB    R10, [R11, #2]
        
        MOV     R7, #16
        UDIV    R8, R6, R7
        MUL     R9, R8, R7
        SUB     R10, R6, R9
        MOV     R6, R8
        
        LDR     R11, =string
        ADD     R10, R10, #0x41
        STRB    R10, [R11, #1]
        
        MOV     R7, #16
        UDIV    R8, R6, R7
        MUL     R9, R8, R7
        SUB     R10, R6, R9
        MOV     R6, R8
        
        LDR     R11, =string
        ADD     R10, R10, #0x41
        STRB    R10, [R11, #0]

        LDR     R11, =string
        MOV     R10, #0
        STRB    R10, [R11, #3]
        
        LDR     R5, =string     
        BL      LCD_WriteString

       
        //MOV R9, #10
        //UDIV R10, R8, R9
        //MUL R11, R10, R9
        //SUB R12, R8, R11
     
        //ADD R12, R12, #0x30
        
        //MOV     R5, R12
        
        //BL LCD_WriteCharacter
        
        //SUB     R0, R0, #10
        //CMP     R10, #0
        //BEQ wait
                
        B wait
   

        END
