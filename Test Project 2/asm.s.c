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
	;ENABLE PLL REGISTER
	LDR	R0, =RCC_CR
	LDR	R1, [R0]
	ORR	R1, R1, #(0x1000000)
	STR	R1, [R0]
	;ENABLE RANDOM NUMBER GENERATOR CLOCK
	LDR	R0, =RCC_AHB2ENR
	LDR	R1, [R0]
	ORR	R1, R1, #(1<<6)
	STR 	R1, [R0]
	
	;ENABLE RANDOM NUMBER GENERATOR
	LDR	R0, =RNG_CR
	LDR	R1, [R0]
	ORR	R1, R1, #(1<<2)
	STR	R1, [R0]
	
CHECK_AGAIN
	LDR	R0, =RNG_DR
	LDR	R1, [R0]
	PUSH	{R1}
	
	B	CHECK_AGAIN

          END
