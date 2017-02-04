.model small
.data
ARR dw 0020H,0070H,0040H,0010H,0050H
CNT EQU 5
.code
        mov ax,@data
        mov ds,ax
        mov dx,CNT-1
again0 : mov cx,dx
          lea SI,ARR
again1 : mov ax,[SI]
          cmp ax,[SI+2]
          JL loop1
          xchg [SI+2],ax
          xchg [SI],ax
loop1 :  add SI,02
          loop again1
          dec dx
          jnz again0
          mov ah,4ch
          int 21h
          end
