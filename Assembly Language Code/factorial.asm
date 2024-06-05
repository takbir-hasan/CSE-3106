.model small
.stack 100h
.data
    number dw 5              ; Number to calculate the factorial of
    result dw 1               ; Variable to store the result
    msg db 'Factorial is $'   ; Message to display the result
.code
main proc
    mov ax, @data
    mov ds, ax
   ; mov es, ax
    
          
   
    ;mov number,ax
    ; Initialize the result
    mov cx, number            ; Move the number to CX
    mov bx, result            ; Move the address of result to BX
    mov ax, 1                 ; AX will hold the intermediate results

factorial_loop:
    cmp cx, 0                 ; Check if CX is 0
    je factorial_done         ; If CX is 0, jump to factorial_done
    mul cx                    ; Multiply AX by CX
    dec cx                    ; Decrement CX by 1
    jmp factorial_loop        ; Repeat the loop

factorial_done:
    mov result, ax            ; Store the result in the result variable

    ; Display the result
    lea dx, msg               ; Load the address of msg into DX
    mov ah, 09h               ; Select DOS function 09h (print string)
    int 21h                   ; Call DOS interrupt

    ; Convert the result to a string and display it
    mov ax, result            ; Move the result to AX
    call print_number         ; Call the function to print the number

    ; Terminate the program
    mov ax, 4C00h
    int 21h
main endp

; Function to print a number
print_number proc
    mov bx, 10                ; BX = 10 (base for decimal)
    xor cx, cx                ; Clear CX (will be used to store the digits)
print_digit_loop:
    xor dx, dx                ; Clear DX
    div bx                    ; Divide AX by BX
    add dl, '0'               ; Convert remainder to ASCII
    push dx                   ; Push the digit on the stack
    inc cx                    ; Increment the count of digits
    cmp ax, 0                 ; Check if AX is 0
    jne print_digit_loop      ; If not, repeat the loop

print_digits:
    pop dx                    ; Pop the digit from the stack
    mov ah, 02h               ; Select DOS function 02h (print character)
    int 21h                   ; Call DOS interrupt
    loop print_digits         ; Repeat for all digits

    ret
print_number endp

end main
