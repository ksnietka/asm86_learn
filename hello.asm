section .data
  msg db "Hello, world!", 0xA
  len equ $ - msg

section .bss
  buffer resb 64

section .text
  global _start
; rax - syscall
; rdi - first arg
; rds - second arg = output
; rdx - length?
;
_start:
  mov rax, 0
  mov rdi, 0
  mov rsi, buffer
  mov rdx, 64
  syscall


  mov rdx, rax
  mov rax, 1
  mov rdi, 1
  mov rsi, buffer
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall
