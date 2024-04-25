.model small
.stack 100h  
.data

str1 db 'Enter a number: $'
str2 db '   Greater $'
str3 db '   Smaller $'

.code
 

main proc
    
         l: 
          mov ah,1
          int 21h
          mov bl,al    
        
          mov ah,2
          mov dl,bl  
          int 21h 
           
          mov dl,0ah  
          int 21h  
          mov dl,0dh
          int 21h 
          
          
          cmp bl,64     ; compare with a given char in ascii  value
          je exit 
          jmp l
          
  
            
          exit:
          
        
         
         mov ah,4ch
         int 21h
         main endp
end main