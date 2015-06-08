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
        SECTION .text : CODE (2)
	THUMB

	MOV	R0, #0				;INITIALIZE FIRST FIBB NUM
	MOV	R1, #1				;INITIALIZE SECOND FIB NUM
	MOV	R3, #25				;iNITIALIZE COUNTER TO 25
main    
	PUSH	{R0}
	
	ADD	R0, R1				;ADD TWO VALUES OF FIB NUM
	
	MOV	R2, R0				;SWAP R0 AND R1
	MOV	R0, R1
	MOV	R1, R2
	
	SUB	R3, R3, #1			;DECREMENT COUNT
	CMP	R3, #0				;CHECK IF COUNT IS ZERO
	BNE	main				;IF ZERO, RESTART
	
        END
