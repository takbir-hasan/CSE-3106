.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV CL,'1'
    

TOP: 
    
    MOV AH,2   
    MOV DL,CL
    INT 21H
    INC CL
    CMP BL,CL
    JE EXIT
    JMP TOP 

EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN