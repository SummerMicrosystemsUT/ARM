#include <ST/iostm32f207zx.h>

	NAME    main
        
        PUBLIC  __iar_program_start
        PUBLIC  __vector_table
	
	SECTION CSTACK : DATA : NOROOT(3)

        SECTION .intvec : CODE : NOROOT(2)		
        DATA
	
__vector_table
        DCD     sfe(CSTACK)			;STACK POINTER INITIALIZER
        DCD     __iar_program_start		;RESET HANDLER
        
__iar_program_start
        SECTION .text : CODE (2)
	THUMB

	MOV	R0, #0
	MOV	R1, #1
	
	PUSH	{R0}
	PUSH	{R1}
main    
	ADD	R0, R1
	ADD	R1, R0
	
	PUSH	{R0}
	PUSH	{R1}
	
	B	main

        END
