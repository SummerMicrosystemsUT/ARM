        NAME    main
	
        PUBLIC  __iar_program_start

	SECTION .stack : DATA (8)
	
	DC8 0x100

        SECTION .intvec : CODE (2)
        THUMB
	
__vector_table
        
__iar_program_start
        B       main

        
        SECTION .text : CODE (2)
        THUMB
main    
	MOV	R0, #0
	MOV	R1, #1
	
LOOP	;CALCULATES FIBONACCI SEQUENCE EFFICIENTLY
	ADD	R0, R1, R0
	ADD	R1, R1, R0
	PUSH 	{R0}
	PUSH 	{R1}
	
	B	LOOP
	
	
        END
