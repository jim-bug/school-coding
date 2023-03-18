; Fatto da Ignazio Sperandeo
; MANDARE A VIDEO I CARATTERI DALLA A-Z USANDO IL BIOS: 
; hex    bin        color
; 
; 0      0000      black
; 1      0001      blue
; 2      0010      green
; 3      0011      cyan
; 4      0100      red
; 5      0101      magenta
; 6      0110      brown
; 7      0111      light gray
; 8      1000      dark gray
; 9      1001      light blue
; a      1010      light green
; b      1011      light cyan
; c      1100      light red
; d      1101      light magenta
; e      1110      yellow
; f      1111      white
 

; per poter mandare a video un carattere o una sequenza di caratteri abbiamo 3 modi:
; 
;   1 - Attraverso la memoria grafica, quindi e' obbligatorio conoscere l'hardware della scheda grafica
;   2 - Attraverso il BIOS.
;   3 - Attraverso il sistema operativo DOS.
;
; per questa esercitazione comunicheremo col bios per mandare a schermo i caratteri dalla A alla Z, per fare questo utilizzermo le interupt
; del bios, l'interupt in questione e' la 10h e chiameremo la funzione 09h per mandare a video i caratteri.
; Questa funzione prevede:
;   AH = la funzione
;   BH = il numero della pagina del display
;   CX = il numero di caratteri da mandare a schermo
;   AL = il carattere
;   BL = attributi
; quindi i valori che devono cambiare sono quelli nei registri BL e AL.

org 100h
mov bh, 00h
mov cx, 01h
mov al, 'A'
mov bl, 01001110b
mov dh, 00h ; parametri della funzione 02h, setto il cursore alla prima riga
mov dl, 00h ; parametri della funzione 02h, setto il cursore alla prima colonna, dh verra' incrementato durante
;  il ciclo per avere tutti i caratteri uno dopo l'altro. 

stampa_car:
    mov ah, 02h  ; assegno ad ah la funzione 02h
    int 10h      ; mando l'interupt via software, e quindi mi settera' il cursore
    mov ah, 09h  ; adesso sovrascriviamo il valore precedente ad ah con 09h, ossia la funzione che manda a video.
    int 10h      ; mando l'interupt via software
    inc al       ; cambio carattere.
    add bl, 17   ; cambio colori
    inc dl       ; mi sposto di uno sull'altra colonna
cmp al, 5Bh      ; confronto tra il carattere e 91 che sarebbe il codice ascii della Z + 1
jne stampa_car   ; salta all'etichetta "stampa_car" se al e' diverso da 91. 

ret