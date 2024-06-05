.MODEL SMALL
.STACK 100h

.DATA
    NUM1 DW 1234h   ; Declare two 16-bit numbers
    NUM2 DW 0ABCh
    RESULT DW ?    ; Storage for results
    NEWLINE DB 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

;------------Function to print 16 bit number in AX---------------
PRINT_NUM PROC   
    PUSH AX      ; Save AX on stack
    PUSH BX
    PUSH CX
    PUSH DX
 
    ;extract digits and print
    XOR CX, CX  ; Clear CX to use as a counter
    MOV BX, 10  ; Base for division

EXTRACT_LOOP:
    XOR DX, DX  ; Clear DX for division
    DIV BX      ; Divide AX by 10 (quotient in AX, remainder in DX)
    PUSH DX     ; Push remainder (digit) onto stack
    INC CX      ; Increment digit counter
    TEST AX, AX ; Check if quotient is zero
    JNZ EXTRACT_LOOP

;print the digits
PRINT_LOOP:
    POP DX      ; Pop digit from stack
    ADD DL, '0' ; Convert digit to ASCII
    MOV AH, 02h ; Print character function
    INT 21h     ; Print character
    LOOP PRINT_LOOP ; Print till the CX becomes 0 
    
    POP DX
    POP CX
    POP BX
    POP AX      ; Restore AX from stack
    RET
PRINT_NUM ENDP
;-----------------end of procedure-----------------------------

    ; Addition
    MOV AX, NUM1 
    ADD AX, NUM2     ; AX = AX + NUM2
    MOV RESULT, AX   ; Store the result
    print "Addition Result: "
    call PRINT_NUM 
    mov ah, 09h
    lea dx, NEWLINE
    int 21h  ; Print a newline


    ; Subtraction
    MOV AX, NUM1
    SUB AX, NUM2     ; AX = AX - NUM2
    MOV RESULT, AX   ; Store the result
    print "Subtraction Result: "
    call PRINT_NUM 
    mov ah, 09h
    lea dx, NEWLINE
    int 21h  ; Print a newline


    ; Multiplication
    MOV AX, NUM1
    MUL NUM2         ; DX:AX = AX * NUM2 (Result in DX:AX)
    MOV RESULT, AX   ; Store lower 16 bits of the result
    print "Multiplication Result: "
    call PRINT_NUM 
    mov ah, 09h
    lea dx, NEWLINE
    int 21h  ; Print a newline

    ; Division (Unsigned)
    MOV AX, NUM1
    XOR DX, DX       ; Clear DX for 32-bit dividend
    DIV NUM2         ; AX = Quotient, DX = Remainder
    MOV RESULT, AX   ; Store the quotient
    print "Division Result (Quotient): "
    call PRINT_NUM 
    mov ah, 09h
    lea dx, NEWLINE
    int 21h  ; Print a newline
   
    ; Logical AND
    MOV AX, NUM1
    AND AX, NUM2     ; AX = AX & NUM2
    MOV RESULT, AX   ; Store the result
    print "Logical AND Result: "
    call PRINT_NUM 
    mov ah, 09h
    lea dx, NEWLINE
    int 21h  ; Print a newline
 
    ; Logical OR
    MOV AX, NUM1
    OR  AX, NUM2     ; AX = AX | NUM2
    MOV RESULT, AX   ; Store the result
    print "Logical OR Result: "
    call PRINT_NUM 
    mov ah, 09h
    lea dx, NEWLINE
    int 21h  ; Print a newline

    ; Logical XOR
    MOV AX, NUM1
    XOR AX, NUM2     ; AX = AX ^ NUM2
    MOV RESULT, AX   ; Store the result
    print "Logical XOR Result: "
    call PRINT_NUM 
    mov ah, 09h
    lea dx, NEWLINE
    int 21h  ; Print a newline


    MOV AH, 4Ch     ; DOS Exit function
    INT 21h

MAIN ENDP
END MAIN
