.model small
.data
FIRE db 086H,0CEH,0F9H,08EH
HELP db 08CH,0C7H,086H,089H
.code
start : mov ax,@data
        mov ds,ax
        mov dx,9803h
        mov al,80h
        out dx,al
        mov bh,0Ah
again : mov si,offset FIRE
        call disp
        call delay
        dec bh
        cmp bh,00h
        je terminate
        jnz again
        disp proc
        mov cx,04h
loop1 : mov bl,08h
        mov al,[si]
next : rol al,01h
       mov dx,9801h
       out dx,al
       push ax
       mov al,0FFh
       inc dx
       out dx,al
       mov al,00h
       out dx,al
       dec bl
       pop ax
       jz next1
       jmp next
next1 : inc si
        loop loop1
        ret
       disp endp
        delay proc
        push ax
        push cx
       mov cx,0FFFh
loop2 : mov ax,0FFFFh
loop3 : dec ax
        jnz loop3
        loop loop2
        pop cx
        pop ax
        ret
        delay endp
terminate:  mov ah,4ch
            int 21h
            end start
