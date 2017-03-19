CLRSCR MACRO
mov al,02h
mov ah,00h
int 10h
endm
.model small
.data
msg1 db 10,13,"The System time is : $"
msg2 db 10,13,"The System date is : $"
.code
mov ax,@data
mov ds,ax
CLRSCR
lea dx,msg1
mov ah,09h
int 21h
mov ah,2ch
int 21h
mov al,ch
aam
mov bx,ax
call disp
mov dl,':'
mov ah,02h
int 21h
mov al,cl
aam
mov bx,ax
call disp
mov dl,':'
mov ah,02h
int 21h
mov al,dh
aam
mov bx,ax
call disp
lea dx,msg2
mov ah,09h
int 21h
day : mov ah,2ah
      int 21h
      mov al,dl
      aam
      mov bx,ax
      call disp
      mov dl,'/'
      mov ah,02h
      int 21h
month : mov ah,2ah
        int 21h
        mov al,dh
        aam
        mov bx,ax
        call disp
        mov dl,'/'
        mov ah,02h
        int 21h
year : mov ah,2ah
       int 21h
       add cx,0F830H
       mov ax,cx
       aam
       mov bx,ax
       call disp
       mov ah,4ch
       int 21h
disp proc near
mov dl,bh
add dl,30h
mov ah,02h
int 21h
mov dl,bl
add dl,30h
mov ah,02h
int 21h
ret
disp endp
end

