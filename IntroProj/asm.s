#include <ST/iostm32f207zx.h>
#include "ext_trim.h"
#include "UserButton.h"

        NAME    main
        
        PUBLIC  __iar_program_start
        PUBLIC  __iar_data_init3
        
        SECTION .stack : DATA (8)

        DS8 0x100

stack_base
        
        SECTION .intvec : CODE (6)
        THUMB
        
        DATA
__vector_table
        DC32 stack_base                 ; 0 (Initial Stack Pointer)
        DC32 __iar_program_start        ; 1 (Reset)
        DC32 0                          ; 2 (NMI)
        DC32 0                          ; 3 (Hard Fault)
        DC32 0                          ; 4 (Memory Management Fault)
        DC32 0                          ; 5 (Bus Fault)
        DC32 0                          ; 6 (Usage Fault)
        DC32 0                          ; 7 (Reserved)
        DC32 0                          ; 8 (Reserved)
        DC32 0                          ; 9 (Reserved)
        DC32 0                          ; 10 (Reserved)
        DC32 0                          ; 11 (SVCall)
        DC32 0                          ; 12 (Reserved)
        DC32 0                          ; 13 (Reserved)
        DC32 0                          ; 14 (PendSV)
        DC32 0                          ; 15 (Systick)
        
        THUMB
__iar_data_init3
        BX LR
        
__iar_program_start
        B       main
        
        SECTION .text : CODE (2)

        THUMB

main    NOP
        
        BL EXT_TRIM_Init
        
loop
        BL EXT_TRIM_Get_Counts
        
        B loop
     
        END
