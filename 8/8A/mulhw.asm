.model small
.code
mov dx,9803h
mov al,82h
out dx,al
mov dx,9801h
in al,dx
mov bl,al
mov dx,9801h
in al,dx
mul bl
mov dx,9800h
out dx,al
mov al,ah
out dx,al
mov ah,4ch
int 21h
end
