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

main

	B	main


        END
