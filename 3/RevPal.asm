DISP MACRO MSG
LEA DX,MSG
MOV AH,09H
INT 21H
ENDM
.MODEL SMALL
.DATA
STR DB "GUGU$"
CNT DB ($-STR)
MSG1 DB 10,13,"PALINDROME$"
MSG2 DB 10,13,"NOT A PALINDROME$"
MSG3 DB 10,13,"THE REVERSE STRING IS $"
RSTR DB 10 DUP(0)
.CODE
MOV AX,@DATA
MOV DS,AX
MOV ES,AX
LEA SI,STR
MOV CL,CNT
DEC CX
ADD SI,CX
DEC SI
LEA DI,RSTR
AGAIN : MOV AL,[SI]
        MOV [DI],AL
        DEC SI
        INC DI
        DEC CX
        CMP CX,0000H
        JNZ AGAIN
        MOV AL,"$"
        MOV [DI],AL
        LEA SI,STR
        LEA DI,RSTR
        MOV CL,CNT
        REPE CMPSB
        JE PALIN
        DISP MSG2
        JMP EXIT
PALIN : DISP MSG1
EXIT : DISP MSG3
       DISP RSTR
       INT 3H
       END
