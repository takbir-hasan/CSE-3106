Include 'emu8086.inc'
.MODEL SMALL
.STACK 100h

.DATA
   

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

   printn "Enter a character:"
   
    ; Read character from keyboard
    MOV AH, 01h
    INT 21h

   printn ""
   
    Mov AH,02H
    MOV DL, AL   ; Move input character (from AL) to output register (DL)
    INT 21h

    MOV AH, 4Ch  ; DOS Exit function
    INT 21h

MAIN ENDP
END MAIN
