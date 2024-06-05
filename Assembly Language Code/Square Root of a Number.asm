.model small
.stack 100
.data
num dw 9
result dw ?
.code
main proc
mov ax, @data
mov ds, ax
mov ax, 0
mov bx, num
mov si, 0
loop1:
mov ax, si
mul ax
cmp ax, bx
je endLoop1
jg endLoop2
inc si
jmp loop1
endLoop1:
mov result, si
jmp terminateProg
endLoop2:
dec si
mov result, si
terminateProg:  
mov ax,si   
add ax,48
mov ah,2
mov dl,al
int 21h
mov ah, 4ch
int 21h
main endp
end main