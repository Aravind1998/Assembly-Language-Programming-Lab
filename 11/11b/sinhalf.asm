.model small
.data
arr db 7Fh,08Ch,099h,0A6h,0B2h,0BEh,0C9h,0D3h,0DDh,0E5h,0F3h,0F7h
    db 0FBh,0FDh,0FEh,0FDh,0F7h,0F3h,0ECh,0E5h,0DDh,0D3h,0C9h,0BEh,0B2h
    db 0A6h,099h,08Ch,7Fh,71h,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh
    db 7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh,7Fh
.code
mov ax,@data
mov ds,ax
mov dx,9803h
mov al,80h
out dx,al
up1 : lea si,arr
      mov cx,60
up  : mov al,[si]
      mov dx,9800h
      out dx,al
      mov dx,9801h
      out dx,al
      call DELAY
      inc si
      loop up
      jnz stop
      jmp up1
stop: mov ah,4ch
      int 21h
      DELAY proc
      push bx
      push cx
      mov cx,0FFFh
repeat: mov bx,0FFFh
here1 : dec bx
       jnz here1
       loop repeat
       pop cx
       pop bx
       ret
       DELAY endp
       end


