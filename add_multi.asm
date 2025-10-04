section .bss
  num1 resb 20
  num2 resb 20
  result resb 21


section .text
  global _start

_start:
  ; load num1
  mov rax, 0
  mov rdi, 0
  mov rsi, num1
  mov rdx, 20
  syscall

  ; load num2
  mov rax, 0
  mov rdi, 0
  mov rsi, num2
  mov rdx, 20
  syscall

  xor rax, rax

  ;integer num1 conversion
  mov rcx, 0
convert_num1:
  mov bl, [num1+rcx]
  cmp bl, 10
  je done_num1
  sub bl, '0'
  imul rax, rax, 10
  add rax, rbx
  inc rcx
  jmp convert_num1
done_num1:
  xor rbx, rbx
  mov rcx, 0
  
  ;integer num2 conversion
convert_num2:
  mov dl, [num2+rcx]
  cmp dl, 10
  je done_num2
  sub dl, '0'
  imul rbx, rbx, 10
  add rbx, rdx
  inc rcx
  jmp convert_num2
done_num2:
  
  ; add
  add rax, rbx
  mov rbx, 10
  mov rcx, result+20

  ; integer to ASCI conversion
convert_loop:
  xor rdx, rdx
  div rbx
  add dl, '0'
  dec rcx
  mov [rcx], dl
  cmp rax, 0
  jne convert_loop

  lea rsi, [rcx]
  mov rdx, result+20
  sub rdx, rcx

print_result:
  mov rax, 1
  mov rdi, 1 
  syscall

  ;exit
  mov rax, 60
  xor rdi, rdi
  syscall

