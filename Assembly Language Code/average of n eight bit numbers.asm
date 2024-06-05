.model small
.stack 100
.data
num dw 5
numbers db 1, 2, 3, 4, 5
result dw ?
.code
main proc
mov ax, @data
mov ds, ax
mov cx, num
mov ax, 0
mov si, offset numbers
loop1:
add al, [si]
inc si
loop loop1
mov bx, num
div bx
mov result, ax
add ax,48
mov ah,2
mov dl,al
int 21h
main endp
end main