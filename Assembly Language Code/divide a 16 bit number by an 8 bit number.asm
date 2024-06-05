.model small
.stack 100h
.data
num1 dw 1234
num2 db 2
result dw ?
.code
main proc
mov ax, @data
mov ds, ax
mov ax, num1
mov bl, num2
div bx
mov result, ax
sub ax,'0'
mov ah,2
mov dx,ax
int 21h
main endp
end main