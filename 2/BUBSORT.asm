.model small
.data
ARR db 10H,08H,04H,09H,06H
LEN db ($-ARR)

.code
mov ax,@data
mov ds,ax
mov bl,LEN
dec bl
outloop : mov cl,bl
          mov SI,00H
inloop :  mov al,arr[SI]
          cmp al,arr[SI+1]
          jb next
          xchg al,arr[SI+1]
          mov arr[SI],al
next :    inc SI
          loop inloop
          dec bl
          jnz outloop
          mov ah,4ch
          int 21h
          end
