; 8086 program to convert a 16-bit decimal number to Hexadecimal
.MODEL SMALL
.STACK 100H
.DATA
    d1 DW 15
.CODE
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX

    ; Load the value stored in variable d1
    MOV AX, d1

    ; Convert the value to Hexadecimal and print the value
    CALL PRINT

    ; Interrupt to exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP

PRINT PROC
    ; Initialize count
    MOV CX, 0
    MOV DX, 0

label1:
    ; If AX is zero
    CMP AX, 0
    JE print1

    ; Initialize BX to 16
    MOV BX, 16

    ; Divide it by 16 to convert it to Hexadecimal
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

    ; Compare the value with 9
    CMP DX, 9
    JLE continue

    ; If value is greater than 9
    ; then add 7 so that after adding 48 it represents A
    ; for example, 10 + 7 + 48 = 65 which is ASCII value of A
    ADD DX, 7

continue:
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
