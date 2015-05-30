#include <ST/iostm32f207zx.h>

	NAME    main
        
        PUBLIC  __iar_program_start
        PUBLIC  __vector_table
	
	SECTION CSTACK:DATA:NOROOT(3)

        SECTION .intvec:CODE:NOROOT(2)
        DATA
	
__vector_table
        DCD     sfe(CSTACK)
        DCD     __iar_program_start
        
__iar_program_start
        SECTION .text : CODE (2)
	THUMB

main    

	;ENABLE RANDOM NUMBER GENERATOR CLOCK
	LDR	R0, =RCC_AHB2ENR
	LDR	R1, [R0]
	ORR	R1, R1, #(1<<6)
	STR 	R1, [R0]
	
	;ENABLE RANDOM NUMBER GENERATOR
	LDR	R0, =RNG_CR
	LDR	R1, [R0]
	ORR	R1, R1, #(1<<2)
	ORR	R1, R1, #(1<<3)
	STR	R1, [R0]
CHECK_AGAIN
	;CHECK IF RNG HAS SET A VALUE
	LDR	R0, =RNG_SR
	LDR	R1, [R0]
	TST	R1, #(1<<0)
	BEQ	CHECK_AGAIN       ;this and the next instruction are backwards.
	B	NUMBER_GENERATED
NUMBER_GENERATED
	LDR	R0, =RNG_DR
	LDR	R1, [R0]
	
	B	CHECK_AGAIN

          END
