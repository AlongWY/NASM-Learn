;-------------------Hello World Program(include)--------------------
; by alongwy
; 编译： nasm -f elf helloworld-inc.asm
; 链接： ld -m elf_i386 helloworld-inc.o -o helloworld-inc
;        64位系统需要 elf_i386 选项
; 运行： ./helloworld-inc
;-------------------------------------------------------------------

%include    'functions.asm'              ; 包含头文件
SECTION .data                            ; 数据段
    msg1    db  'Hello World!', 0Ah, 0h  ; 创建字符串，0Ah是换行符
    msg2    db  'Hello NASM!', 0Ah, 0h   ; 后面添加了一个0
    
SECTION .text                            ; 代码段
global  _start

_start:
    mov     eax, msg1           ; 存入mag1的地址
    call    sprint              ; 调用sprint打印

    mov     eax, msg1
    call    sprint

    call    exit                ; 退出
