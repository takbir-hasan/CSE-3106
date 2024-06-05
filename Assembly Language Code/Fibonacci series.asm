.model small
.stack 100h
.data
    msg db 'Fibonacci Series:', 0Dh, 0Ah, '$'  ; Message to print
    fib dw 10 dup (?)                          ; Array to store Fibonacci terms as 16-bit values
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print the initial message
    lea dx, msg
    mov ah, 09h
    int 21h

    ; Initialize the first two Fibonacci numbers
    mov word ptr fib[0], 0
    mov word ptr fib[2], 1

    ; Calculate the Fibonacci series
    mov cx, 8          ; We already have the first two terms, calculate the next 8
    mov si, 4          ; Index for storing the next term (2 bytes each)
calc_fib:
    mov ax, word ptr fib[si-4]  ; Load fib[n-2]
    add ax, word ptr fib[si-2]  ; Add fib[n-1]
    mov word ptr fib[si], ax    ; Store the result in fib[n]
    add si, 2                   ; Increment the index by 2 (16-bit values)
    loop calc_fib

    ; Print the Fibonacci series
    mov cx, 7         ; Number of terms to print
    mov si, 0          ; Starting index
print_fib:
    mov ax, word ptr fib[si]    ; Load the current Fibonacci term
    call print_num              ; Print the number
    add si, 2                   ; Increment the index by 2 (16-bit values)
    loop print_fib

    ; Terminate the program
    mov ax, 4C00h
    int 21h

main endp

; Procedure to print a number in AX
print_num proc
    ; Check if the number is less than 10
    cmp ax, 10
    jl one_digit

    ; If the number is two or more digits
    mov bx, 10
    xor dx, dx
print_loop:
    div bx                ; Divide AX by 10, quotient in AX, remainder in DX
    push dx               ; Push the remainder on the stack
    or ax, ax
    jnz print_loop        ; Continue until AX is zero

print_digits:
    pop dx                ; Pop the digits from the stack
    add dl, '0'           ; Convert digit to ASCII
    mov ah, 02h
    int 21h
    cmp sp, bp
    jne print_digits

    ; Print space for separation
    mov dl, ' '
    mov ah, 02h
    int 21h
    ret

one_digit:
    ; Print single digit number
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    ; Print space for separation
    mov dl, ' '
    mov ah, 02h
    int 21h
    ret
print_num endp

end main
