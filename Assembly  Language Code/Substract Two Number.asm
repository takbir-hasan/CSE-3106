.MODEL SMALL
.STACK 100H
.DATA 

    MSG1 DB 'First Number: $'
    MSG2 DB 13,10,'Second Number: $'         ;THE VARIBALES ARE DECLARED HERE!
    MSG3 DB 13,10,'Substraction: $'
   
    
.CODE 

    MAIN PROC
                
                MOV AX, @DATA     ;INTITIALIZE DATA SIGMENT
                MOV DS,AX
                           
                LEA DX,MSG1      ; LOAD EFFECTIVE ADDRESS 
                MOV AH,9
                INT 21H
                MOV AH,1
                INT 21H
                MOV BH,AL
                  
                
                
            
                LEA DX,MSG2       ; LOAD EFFECTIVE ADDRESS 
                MOV AH,9
                INT 21H  
                MOV AH,1
                INT 21H
                MOV BL,AL    
                 
                 SUB BH,BL           ;BH = BH-BL
                 ADD BH,48
                 
                
                LEA DX,MSG3       ; LOAD EFFECTIVE ADDRESS 
                MOV AH,9
                INT 21H 
                MOV AH,2 
                MOV DL,BH 
                INT 21H
                
             
            
            
        
      MOV AH, 4CH
       INT 21H
     MAIN ENDP
        
  END MAIN 