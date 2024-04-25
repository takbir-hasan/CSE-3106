                           .MODEL SMALL
.STACK 100H
.DATA 

    MSG1 DB 'Takbir is a good boy. $'
    MSG2 DB 'Nothing is very very important $'                ;THE VARIBALES ARE DECLARED HERE!
    
   
    
.CODE 

    MAIN PROC
                
                MOV AX, @DATA     ;INTITIALIZE DATA SIGMENT
                MOV DS,AX
                           
                LEA DX,MSG1      ; LOAD EFFECTIVE ADDRESS 
                MOV AH,9
                INT 21H  
                
                MOV AH,2
                MOV DL,0AH 
                INT 21H          ;NEWLINE
                MOV DL,0DH       
                INT 21H
            
                LEA DX,MSG2       ; LOAD EFFECTIVE ADDRESS 
                MOV AH,9
                INT 21H  
             
            
            
        
      MOV AH, 4CH
       INT 21H
     MAIN ENDP
        
  END MAIN   