; Fatto da Ignazio Sperandeo
; ESERCITAZIONE SISTEMI, METTERE IN AX E BX 5 E 22, DEPOSITARE IN AX LA LORO SOTTRAZIONE, SUCCESSIVAMENTE INCREMETARE DUE VOLTE
; AX E DECREMENTARE UNA VOLTA AX, FARE LO XOR DI AH E AL E FARE IL NOT DI AX, E VISUALIZZARE I REGISTRI FLAG
org 100h

MOV AX, 05h
MOV BX, 22
SUB AX, BX
INC AX  ; INCREMENTO
INC AX
DEC AX  ; DECREMENTO
XOR AH, AH 
; usando lo xor di due input uguali il risultato sara 0,
; quindi usando lo xor dello stesso registro azzeriamo un registro.
; potremmo pero fare:
; SUB register, register, assegno al registro la sottrazione dello stesso registro, quindi 0
NOT AH

ret
