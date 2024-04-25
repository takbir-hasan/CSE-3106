INCLUDE 'EMU8086.INC'
.MODEL SMALL 
.STACK 100H 
.CODE

MAIN PROC 
        
         call function
         
         printn "I am the main function!"
         printn 'I am the boss.'
        
 
    MOV AH,4CH
    INT 21H
    MAIN ENDP  
               
               
               function proc
                
                  printn "Hi!Bro."
                  printn 'how are you?'
                  printn 'I am the function.'
                  
                  ret
                function endp


END MAIN