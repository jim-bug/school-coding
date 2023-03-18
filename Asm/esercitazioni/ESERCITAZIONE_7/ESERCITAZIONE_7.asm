; Fatto da Ignazio Sperandeo
; MANDARE A VIDEO I CARATTERI DALLA A-Z USANDO DOS: 
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
; per questa esercitazione useremo le interrupt del DOS, l'interrupt in questione e' il 21h, e la funzione e' 02h ecco i suoi parametri:
;   ah, 02h
;   dl, carattere

org 100h


mov dh, 01001110b
mov ax, 0b800h
mov es, ax

xor si, si
set_color:
    mov es:[si], dx  ; setto il colore, passando tutto dx, stiamo dando il colore alla cella ma dato che dl e' 00h il codice ascii 0 e' NULL, settera' solo il colore.
    add si, 2        ; mi sposto di una posizione
    add dh, 17       ; cambio colori
cmp si, 52           ; itero per 52 due volte il si e' l'indice di posizionamento e siccome si deve spostare ogni volta di due, ho fatto n_char*2.
jne set_color 

mov ah, 02h       ; funzione del DOS
mov dl, 'A'       ; primo carattere che andra' a video
stampa_car:
    int 21h       ; chiamo l'interrupt
    inc dl        ; cambio carattere.
cmp dl, 5Bh
jne stampa_car


; in questa maniera prima setto i colori alle celle e solo dopo metto i caratteri nelle celle colorate.

ret 