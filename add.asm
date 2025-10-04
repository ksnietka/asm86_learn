section .bss
  num1 resb 5
  num2 resb 5
  result resb 6

section .text 
  global _start

_start:
  ; syscall write
  ;
  ; rax syscall
  ; rdi first param
  ; rsi target param
  ; rdi length

  ; load num1
  mov rax, 0
  mov rdi, 0
  mov rsi, num1
  mov rdx, 5
  syscall
  
  ; load num2
  mov rax, 0
  mov rdi, 0
  mov rsi, num2
  mov rdx, 5
  syscall

  ; add
  mov al, [num1]
  sub al, '0'
  mov bl, al
  mov al, [num2]
  sub al, '0'
  add al, bl
  add al, '0'
  mov [result], al

  ; write
  mov rdx, 6
  mov rax, 1
  mov rdi, 1,
  mov rsi, result
  syscall
  
  ;exit
  mov rax, 60
  mov rdi, 0
  syscall


