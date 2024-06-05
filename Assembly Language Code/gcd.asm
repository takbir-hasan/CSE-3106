.MODEL SMALL
.STACK 100H
.DATA
    d1 DW 15
    d2 DW 10
.CODE
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX

    ; Initialize AX and BX
    MOV BX, d2
    MOV AX, d1

    ; Find GCD of two numbers
    CALL GCD

    ; Load the GCD in AX
    MOV AX, CX

    ; Print the value
    CALL PRINT

    ; Interrupt to exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP

GCD PROC
    ; If BX is 0
    CMP BX, 0
    JNE continue

    ; Then GCD is AX
    MOV CX, AX
    RET

continue:
    ; Else GCD(B, A % B)
    XOR DX, DX

    ; Divide AX by BX
    DIV BX

    ; Initialize AX as BX
    MOV AX, BX

    ; and BX as AX % BX
    MOV BX, DX

    ; Recursively call GCD
    CALL GCD
    RET
GCD ENDP

PRINT PROC
    ; Initialize count
    MOV CX, 0
    MOV DX, 0

label1:
    ; If AX is zero
    CMP AX, 0
    JE print1

    ; Initialize BX to 10
    MOV BX, 10

    ; Extract the last digit
    DIV BX

    ; Push it onto the stack
    PUSH DX

    ; Increment the count
    INC CX

    ; Set DX to 0
    XOR DX, DX

    JMP label1

print1:
    ; Check if count is greater than zero
    CMP CX, 0
    JE exit

    ; Pop the top of the stack
    POP DX

    ; Add 48 so that it represents the ASCII value of digits
    ADD DX, 48

    ; Interrupt to print a character
    MOV AH, 02H
    INT 21H

    ; Decrease the count
    DEC CX

    JMP print1

exit:
    RET
PRINT ENDP

END MAIN
