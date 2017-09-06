;----------Hello World Program(Calculating string length)-----------
; by alongwy
; 编译： nasm -f elf helloworld-len.asm
; 链接： ld -m elf_i386 helloworld-len.o -o helloworld-len
;        64位系统需要 elf_i386 选项
; 运行： ./helloworld-len
;-------------------------------------------------------------------

SECTION .data                            ; 数据段
    msg     db  'Hello World!', 0Ah     ; 创建字符串，0Ah是换行符

SECTION .text                            ; 代码段
global  _start
_start:
    mov     ebx,msg          ; 将字符串初始地址存入EBX寄存器
    mov     eax,ebx          ; 同上
    
nextchar:                    ; 计算字符串长度
    cmp     byte [eax], 0    ; 将eax储存地址指向的数据与0进行比对（字符串以0结尾）
    jz      finished         ; 若标志位被设置为0，则跳转至finished
    inc     eax              ; 递加eax
    jmp     nextchar         ; 跳转至nextchar
    
finished:
    sub     eax, ebx         ; eax = eax - ebx
    mov     edx, eax         ; eax中存储的即为字符串
    mov     ecx, msg         ; 字符串地址
    mov     ebx, 1           ; 写入到标准输出
    mov     eax, 4           ; SYS_WRITE 中断操作数 4
    int     80h              ; 调用系统中断

    mov     ebx, 0           ; 返回值
    mov     eax, 1           ; SYS_EXIT 中断操作数 1
    int     80h              ; 调用系统中断
