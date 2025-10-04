section .bss
  buffer resb 128
  result resb 2

section .text
  global _start

_start:
  ; load text
  mov rax, 0
  mov rdi, 0
  mov rsi, buffer
  mov rdx, 128
  syscall

  ; counters init
  ;
  
  mov rcx, 0 ; index
  mov rbx, 0 ; counter

count_loop:
  cmp rcx, 128
  je done
  mov al, [buffer + rcx]
  cmp al, 10
  je done
  cmp al, '0'
  jb skip
  cmp al, '9'
  ja skip
  inc rbx
skip:
  inc rcx
  jmp count_loop
done:
  mov al, bl
  add al, '0'
  mov [result], al
  mov byte [result +1], 10


  mov rax, 1
  mov rdi, 1
  mov rsi, result
  mov rdx, 2
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall
