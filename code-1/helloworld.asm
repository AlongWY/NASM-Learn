;----------------------Hello World Program--------------------------
; by alongwy
; 编译： nasm -f elf helloworld.asm
; 链接： ld -m elf_i386 helloworld.o -o helloworld
; 运行： ./helloworld
;-------------------------------------------------------------------

SECTION .data                            ; 数据段
msg     db      'Hello World!', 0Ah     ; 创建字符串，0AH是换行符

SECTION .text                            ; 代码段
global  _start
_start:
    mov     edx, 13     ; 字符串长度
    mov     ecx, msg    ; 字符串地址
    mov     ebx, 1      ; 写入到标准输出
    mov     eax, 4      ; 调用SYS_WRITE (中断类型码 4)
    int     80h
