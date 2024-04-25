.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
  
    
    MOV AH,1
    INT 21H 
    MOV BL,AL
    SUB AL,30H
    MOV CX,0
    MOV CL,AL 
    
     LOOP:
    
    
    
 MOV AH,2
 MOV DL,'#'
  
  TOP:
  INT 21H
  LOOP TOP
 
   
     
     EXIT:
     
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN