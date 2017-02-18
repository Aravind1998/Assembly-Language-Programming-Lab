.model small
.stack
.data
N dw 06H
R dw 04H
NCR dw 0
msg1 db 10,13,"Error!NCR value cannot be computed$"

.code
mov ax,@data
mov ds,ax
mov ax,N
mov bx,R
CALL NCRPROC
mov ah,4ch
int 21h

NCRPROC PROC
        cmp ax,00h
        je ERROR
        cmp bx,ax
        jg ERROR
        je RES1
        cmp bx,0
        je RES1
        dec ax
        cmp bx,1
        je RESN
        cmp bx,ax
        je RESN
        PUSH ax
        PUSH bx
        CALL NCRPROC
                POP bx
                POP ax
                dec bx
                PUSH ax
                PUSH bx
                CALL NCRPROC
                POP bx
                POP ax
                RET

ERROR : lea dx,msg1
        mov ah,09h
        int 21h

RES1 : inc NCR
       RET

RESN : inc NCR
       add NCR,ax
       RET

NCRPROC ENDP
        END

        
