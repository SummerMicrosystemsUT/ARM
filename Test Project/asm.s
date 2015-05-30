        NAME    main
        
        PUBLIC  __iar_program_start
        PUBLIC	__vector_table
	
	SECTION CSTACK : DATA (4)
	
        SECTION .intvec : CODE (2)
        THUMB
	
__vector_table
        DCD	sfe(CSTACK)		;stack pointer initializer
	DCD	__iar_program_start	;reset handler
	
__iar_program_start        
        SECTION .text : CODE (2)
        THUMB
	
main   


        END
