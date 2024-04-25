.model small
.stack 100h  
.data

var db 5
var2 db ?

.code

main proc
    
         mov ax,@data
         mov ds,ax 
         
         mov ah,1
         int 21h
         mov var2,al
          
         add var,48
         mov ah,2  
         mov dl,var   
         int 21h     
         
        ; add var2,48    ;no need
         mov ah,2  
         mov dl,var2   
         int 21h  
        
         
         mov ah,4ch
         int 21h
         main endp
end main