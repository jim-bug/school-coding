org 100h
; scrivi un programma in assembly che faccia un ciclo di 5 passaggi
xor cx, cx
pass:
    inc cx
cmp cx, 5
jne pass
ret