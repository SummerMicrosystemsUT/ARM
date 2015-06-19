#include <ST/iostm32f207zx.h>

	NAME UserButton
	        
	PUBLIC UserButtonInit
        PUBLIC UserButtonPressed
        
        SECTION .UserButton : CODE (2)
        THUMB
	
	;USER BUTTON IS ON GPIOG PORT.
	
UserButtonInit
	;ENABLE PERIPHERAL CLOCK THAT HANDLES GPIOG PORT
	LDR	R0, =RCC_AHB1ENR
	LDR	R1, [R0]
	ORR	R1, R1, #(1<<6)
	STR	R1, [R0]
	
	;TURN ON USER BUTTON
	LDR	R0, =GPIOG_MODER
	LDR	R1, [R0]
	BIC	R1, R1, #(3<<12)
	STR	R1, [R0]
	
	BX LR
	
