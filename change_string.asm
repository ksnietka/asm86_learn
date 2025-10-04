section .bss
  buffer resb 100

section .text 
  global _start

_start: 
  mov rax, 0
  mov rdi, 0
  mov rsi, buffer
  mov rdx, 100
  syscall


  xor rcx, rcx
  mov rax, 2

loop:
  mov dl, [buffer + rcx]
  cmp dl, 10
  je end
  mov rax, rcx
  xor rdx, rdx
  mov rbx, 2
  div rbx
  cmp rdx, 1
  je change
  inc rcx
  jmp loop
change:
  mov byte [buffer + rcx], 'A'
  inc rcx
  jmp loop
end:
  mov rax, 1
  mov rdi, 1
  mov rsi, buffer
  mov rdx, rcx
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall


 
