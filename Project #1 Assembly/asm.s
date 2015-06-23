#include <ST/iostm32f207zx.h>
#include "USER_BUTTON.h"
#include "TIMERS.h"
#include "LED.h"
	
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
	
	BL	LED_INIT
	BL	ENABLE_LED_ALL

TheLoop
        ;TURN OFF ALL LEDS
        BL      TURN_OFF_LED_ALL
	
	;CHECK IF USER BUTTON IS PRESSED
        LDR	R2, =GPIOG_IDR
	LDR	R3, [R2]
	TST	R3, #0x40
	BNE	TheLoop
	
	;GENERATE UPDATE EVENT
	BL      TIMER_2_GENERATE_UPDATE_EVENT
	
	;START LOOP FOR INITIAL LED LOOP
        B	START
START
	;LOAD TIMER 2 COUNT
        LDR	R0, =TIM2_CNT
	LDR	R1, [R0]
	
	;TURN ON LED1 AT 500ms
        CMP	R1, #0x1F4
	BNE	START
        BL      TURN_ON_LED_1
LED2
	;LOAD TIMER 2 COUNT
        LDR	R0, =TIM2_CNT
	LDR	R1, [R0]
	
	;TURN ON LED2 AT 1000ms
        CMP	R1, #0x3E8
	BNE	LED2
        BL      TURN_ON_LED_2
LED3
	;LOAD TIMER 2 COUNT
        LDR	R0, =TIM2_CNT
	LDR	R1, [R0]
	
        ;TURN ON LED3 AT 1500ms
        MOV	R0, #0x5DC
	CMP	R1, R0
	BNE	LED3
        BL      TURN_ON_LED_3
LED4
	;LOAD TIMER2 COUNT
        LDR	R0, =TIM2_CNT
	LDR	R1, [R0]

	;TURN ON LED4 AT 2000ms
	CMP	R1, #0x7D0
	BNE	LED4
        BL      TURN_ON_LED_4

WAIT_UPDATE

	BL	TIMER_2_GENERATE_UPDATE_EVENT

WAIT_PT_1
	
        ;CHECK IF USER BUTTON IS PRESSED
        LDR	R2, =GPIOG_IDR
	LDR	R3, [R2]
	TST	R3, #0x40
	BNE	TheLoop
	
	;LOAD TIMER 2 COUNT
        LDR	R0, =TIM2_CNT
	LDR	R1, [R0]
	
        ;TURN OFF ALL LEDS AT 750ms
        MOV	R0, #0x2EE
	CMP	R1, R0
	BNE	WAIT_PT_1
        BL      TURN_OFF_LED_ALL
	
WAIT_PT_2
	
        ;CHECK IF USER BUTTON IS PRESSED
        LDR	R2, =GPIOG_IDR
	LDR	R3, [R2]
	TST	R3, #0x40
	BNE	TheLoop
	
	;LOAD TIMER 2 COUNT
        LDR	R0, =TIM2_CNT
	LDR	R1, [R0]
	
        ;TURN OFF ALL LEDS AT 250ms
        MOV	R0, #0x3E8
	CMP	R1, R0
	BNE	WAIT_PT_2
        BL      TURN_ON_LED_ALL
	
	B	WAIT_UPDATE	
	
        END
