;-------------------Hello World Program(include)--------------------
; 函数头文件
; by alongwy
;-------------------------------------------------------------------


;------------------------------------------
; int slen(String message)
; 计算字符串的长度
slen:
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret

;------------------------------------------
; void sprint(String message)
; 打印字符串
sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax
    call    slen            ;调用slen计算字符串长度

    mov     edx, eax
    pop     eax

    mov     ecx, eax
    mov     ebx, 1
    mov     eax, 4
    int     80h

    pop     ebx
    pop     ecx
    pop     edx
    ret

;------------------------------------------
; void exit()
; 退出程序
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret
