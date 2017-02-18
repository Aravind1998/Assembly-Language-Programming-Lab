.model small
.data
arr dw 1111H,2222H,3333H,4444H,5555H
len equ ($-arr)/2
key equ 3333H
msg1 db "Key found at pos $"
msg2 db "Key not found$"
.code
        mov ax,@data
        mov ds,ax
        mov bx,01H
        mov dx,len
        mov cx,key
again : cmp bx,dx
        ja fail
        mov ax,bx
        add ax,dx
        shr ax,01H
        mov si,ax
        mov di,si
        dec si
        add si,si
        cmp cx,arr[si]
        jae upper
        dec ax
        mov dx,ax
        jmp again
upper : je success
        inc si
        mov bx,ax
        jmp again
success: lea dx,msg1
         mov ah,09H
         int 21h
         add di,30H
         mov dx,di
         mov ah,02H
         int 21h
         jmp exit
fail   : lea dx,msg2
          mov ah,09H
          int 21H
          jmp exit
exit   :  mov ah,4ch
          int 21H
          end
