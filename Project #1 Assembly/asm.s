#include <ST/iostm32f207zx.h>
#include "USER_BUTTON.h"
#include "TIMERS.h"
	
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
	BL	USER_BUTTON_INIT
	
	BL	TIMER_2_INIT

	BL	TIMER_2_GENERATE_UPDATE_EVENT
	

	;ENABLE CCR 1
	LDR	R0, =TIM2_CCER
	LDR	R1, [R0]
	ORR	R1, R1, #(1<<0)
	STR	R1, [R0]
	
	;SET CAPTURE/COMPARE REGISTER
	LDR	R0, =TIM2_CCR1
	LDR	R1, [R0]
	MOV	R1, #0x00004000
	STR	R1, [R0]
	
	
	
TheLoop
	LDR	R1, [R8]
	EOR	R1, R1,R1
	STR	R1, [R8]
	
	LDR	R1, [R6]
	EOR	R1, R1,R1
	STR	R1, [R6]
	
	LDR	R1, [R4]
	EOR	R1, R1,R1
	STR	R1, [R4]
	
	LDR	R1, [R2]
	EOR	R1, R1,R1
	STR	R1, [R2]
	
	LDR	R11, =GPIOG_IDR
	LDR	R12, [R11]
	
	CMP	R12, #0x7600
	BNE	TheLoop
	
	;GENERATE UPDATE EVENT
	LDR	R0, =TIM2_EGR
	LDR	R1, [R0]
	ORR	R1, R1, #(1<<0)
	STR	R1, [R0]
	
	B	START
START
	LDR	R0, =TIM2_CNT
	LDR	R1, [R0]
	
	LDR	R11, =GPIOG_IDR
	LDR	R12, [R11]
	CMP	R12, #0x7600
	BNE	TheLoop
	
	CMP	R1, #0x1F4
	BNE	START
	STR	R3, [R2]
LED2
	LDR	R0, =TIM2_CNT
	LDR	R1, [R0]
	
	LDR	R11, =GPIOG_IDR
	LDR	R12, [R11]
	CMP	R12, #0x7600
	BNE	TheLoop

	CMP	R1, #0x3E8
	BNE	LED2
	STR	R5, [R4]
LED3
	LDR	R0, =TIM2_CNT
	LDR	R1, [R0]
	
	LDR	R11, =GPIOG_IDR
	LDR	R12, [R11]
	CMP	R12, #0x7600
	BNE	TheLoop
	MOV	R0, #0x5DC
	CMP	R1, R0
	BNE	LED3
	STR	R7, [R6]
LED4
	LDR	R0, =TIM2_CNT
	LDR	R1, [R0]
	CMP	R12, #0x7600
	BNE	TheLoop

	LDR	R11, =GPIOG_IDR
	LDR	R12, [R11]
	CMP	R1, #0x7D0
	BNE	LED4
	STR	R9, [R8]		
wait	

	LDR	R11, =GPIOG_IDR
	LDR	R12, [R11]
	CMP	R12, #0x7600
	BNE	TheLoop
	
	B	wait
	
	
	
        END
