INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100h

.DATA
    STR1    DB      20 DUP('$')  ; Buffer for input string (up to 19 characters)
    NL      DB      0DH, 0AH, '$'
    PRINTPAL DB  "PALINDROME$", '$'
    PRINTNOTPAL DB "NOT PALINDROME$", '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DI, STR1        ; DI points to the end of the buffer   
    
    PRINTN "Enter a string:"
    ; Read input until Enter is pressed
    MOV AH, 01h
INPUT_LOOP:
    INT 21h
    CMP AL, 0DH        ; Check for Enter
    JE END_INPUT
    MOV [DI], AL       ; Store the character at the end of the buffer
    INC DI             ; Move DI to the next position
    JMP INPUT_LOOP    

END_INPUT:
    ; Print newline after input
    MOV AH, 09h
    LEA DX, NL
    INT 21h

    ; Set up SI and DI for comparison
    LEA SI, STR1        ; SI points to the start of the string
    DEC DI             ; DI points to the last input character (before '$')

    ; Palindrome Check Loop
CHECK_LOOP:
    CMP SI, DI          ; Check if pointers have crossed 
    JAE PALINDROME     ; If crossed or equal, it's a palindrome
    MOV AL, [SI]       ; Load character from the start
    CMP AL, [DI]       ; Compare with character from the end
    JNE NOTPALINDROME 
    INC SI             ; Move SI forward
    DEC DI             ; Move DI backward
    JMP CHECK_LOOP

PALINDROME:
    MOV AH, 09h
    LEA DX, PRINTPAL
    INT 21h
    JMP EXIT

NOTPALINDROME:
    MOV AH, 09h
    LEA DX, PRINTNOTPAL
    INT 21h

EXIT:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
