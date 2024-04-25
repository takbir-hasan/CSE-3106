.MODEL SMALL
.STACK 100H
.DATA

    ;THE VARIBALES ARE DECLARED HERE!
    
.CODE 

    MAIN PROC
        
           
        MOV AH,1
        INT 21H           ;INPUT NUMBER
        MOV BL,AL 
        
        MOV AH,2
        MOV DL,0AH
        INT 21H          ;NEW LINE
        MOV AH,2
        MOV DL,0DH
        INT 21H 
             
             
        MOV AH,1   
        INT 21H           ;INPUT NUMBER
        MOV CL,AL
        
 
        
        MOV AH,2
        MOV DL,0AH
        INT 21H              ;NEW LINE
        MOV AH,2
        MOV DL,0DH
        INT 21H  
        
  
        
        ADD BL,CL         ;ADD TWO NUMBER
        SUB BL,48
        
        MOV AH,2
        MOV DL,BL        ;OUTPUT
        INT 21H 
        
        
        
        MOV AH,4CH      ;RETURN
        INT 21H
        MAIN ENDP
      
        
  END MAIN   