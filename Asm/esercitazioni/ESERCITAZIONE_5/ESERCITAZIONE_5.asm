; Fatto da Ignazio Sperandeo
; MANDARE A VIDEO I CARATTERI DALLA A ALLA Z CON COLORI DIVERSI UTILIZZANDO IL SEGMENTO DELLA MEMORIA GRAFICA, IL PRIMO CARATTERE DEVE AVERE
; FOREGROUND GIALLO E BACKGROUND ROSSO, GLI ALTRI DEVONO AVERE FOREGROUND E BACKGROND DIVERSI TRA DI LORO: 
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

; PER FARE QUESTA ESERCITAZIONE DOBBIAMO SEMPRE MANDARE A SCHERMO DEI CARATTERI, MA LA DIFFERENZA STA NEL CAMBIARE COLORE, 
; CARATTERE E INDIRIZZO DI MEMORIA DOVE ANDRANNO I CARATTERI.

mov ax, 0b800h
mov es, ax
mov ah, 01001110b
mov al, 'A' ; mandiamo inzialmente il carattere A, poi incrementando al avremo B ecc..
xor si, si  ; azzero il source index, perchè mi servira' come indice di spostameto sul segmento della memoria grafica.
loops:
    mov es:[si], ax
    add ah, 11h ; sommo 17 al registro dei colori in modo tale da far variare i colori
    inc al    ; cambio carattere.
    add si, 2 ; mi sposto di due posti sul segmento della memoria grafica.
cmp al, 5Bh
jne loops

ret