section .bss
  buffer resb 20

section .text
  global _start

_start:
  mov rax, 0
  mov rdi, 0
  mov rsi, buffer,
  mov rdx, 20
  syscall

  mov rcx, 0

loop:
  mov al, [buffer + rcx]
  cmp al, 10
  je done
  cmp al, 'a'
  jb skip
  cmp al, 'z'
  ja skip
  sub al, 32
  mov [buffer+rcx], al
skip: 
  inc rcx
  jmp loop
done:
  mov rax, 1
  mov rdi, 1
  mov rsi, buffer,
  mov rdx, rcx
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall
