.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER AN INPUT: $'
MSG2 DB '  IN RANGE $'
MSG3 DB '  OUT OF RANGE $ '
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
    
    CMP BL,4
    JGE L2
    
 
    L1:
     
     LEA DX,MSG3
     MOV AH,9
     INT 21H
     
     JMP EXIT
     
    L2:
    
       CMP BL,7
       JNG L3
       JMP L1
       
    L3:
        
              
     LEA DX,MSG2
     MOV AH,9
     INT 21H
         
   
   EXIT:
     
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN