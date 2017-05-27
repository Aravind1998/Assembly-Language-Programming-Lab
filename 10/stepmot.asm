.model small
.data
n dw 200
.code
mov ax,@data
mov ds,ax
mov dx,9803h
mov al,80h
out dx,al
mov dx,09800h
mov al,88h
mov cx,n
clock : out dx,al
        call delay
        ror al,01h
        loop clock
        mov cx,n
anticlock : out dx,al
            call delay
            ror al,01h
            loop anticlock
            mov ah,4ch
            int 21h
            delay proc
            push bx
            push cx
            mov cx,03fffh
  outer :   mov bx,0ffffh
  inner : dec bx
          jnz inner
          loop outer
          pop cx
          pop bx
          ret
          delay endp
          end
