.MODEL SMALL
.STACK 100h

.CODE
MAIN PROC
    MOV AX, 5       ; Move the value 5 into AX register
    MOV BX, 3       ; Move the value 3 into BX register
    ADD AX, BX       ; Add the contents of BX to AX (AX = 8)
    MOV CX, AX       ; Copy the value from AX to CX (CX = 8)
    SUB CX, 2       ; Subtract 2 from CX (CX = 6)
    
    ; Print the result (CX) to the console
    MOV AH, 02h     ; Select DOS function to print a character
    ADD CX, '0'     ; Convert the number in CX to ASCII character
    MOV DL, CL      ; Move the lower byte of CX to DL for printing
    INT 21h 
    
    MOV AH, 4Ch     ; DOS Exit function
    INT 21h

MAIN ENDP
END MAIN
