
NAME	RNG
	PUBLIC	RNG_Init
	PUBLIC  RNG_Get_Number
	
	SECTION .ext_trim : CODE (2)
        THUMB
RNG_Init

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
	
	BX, LR
	
RNG_Get_Number

	LDR	R0, =RNG_DR
	LDR	R1, [R0]

	BX, LR
	
	END