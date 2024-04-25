.model small
.stack 100h  
.data

str1 db 'Enter a number: $'
str2 db '   Greater $'
str3 db '   Smaller $'

.code    

 ;CMP = compare
 ;JG  = jump if greater than
 ;JL  = jump if less than
 ;JGE = jump if greater than or equal
 ;JNG = jump if not greater than
 ;JE  = jump if equal
 ;JNE = jump if not equal
 ;JMP = jump
 ;INC = increase
 ;DEC = decrease
 

main proc
    
         mov ax,@data
         mov ds,ax
         
         lea dx,str1 
         mov ah,9
         int 21h
         
         mov ah,1
         int 21h
         mov bl,al 
         sub bl,48
         
          cmp bl,5   
          jg l1
          
          
          
          l1:   
          lea dx,str2
          mov ah,9   
          int 21h  
          jmp exit
          
          l2:   
          lea dx,str3
          mov ah,9   
          int 21h  
            
          
          
          exit:   
        
        
         
         mov ah,4ch
         int 21h
         main endp
end main