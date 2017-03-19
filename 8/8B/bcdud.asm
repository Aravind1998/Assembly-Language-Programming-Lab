.model small
.stack 64
.data
msg1 db "Up Counter Starts$"
msg2 db "Down Counter Starts$"
.code
mov ax,@data
mov ds,ax
mov dx,9803h
mov al,82h
out dx,al
mov cx,0Ah
lea dx,msg1
mov ah,09h
int 21h
mov al,00
up : mov dx,9800h
     out dx,al
     inc al
     daa
     call delay
     loop up
     mov cx,0AH
     lea dx,msg2
     mov ah,09h
     int 21h
     mov al,09
down : mov dx,9800h
       out dx,al
       dec al
       das
       call delay
       loop down
quit : mov ah,4ch
       int 21h
delay proc
push bx
push dx
mov dx,0FFFFh
outer : mov bx,0FFFFH
inner : dec bx
        jnz inner
        dec dx
        jnz outer
        pop dx
        pop bx
        ret
        delay endp
        end
  

