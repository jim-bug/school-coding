; Fatto da Ignazio Sperandeo
; MANDARE A VIDEO UN CARATTERE CON SFONDO ROSSO E COLORE GIALLO UTILIZZANDO IL SEGMENTO DELLA MEMORIA GRAFICA
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

; in questa esercitazione vedremo il primo metodo:
; per fare questo dobbiamo far puntare ad un registro di segmento, l'extra segment, l'indirizzo di memoria del segmento della memoria grafica,
; in modo tale da poter aver accesso alla memoria grafica e di poter mandare a schermo i caratteri.
; Adesso, questa scheda grafica dedica 2 byte per tutto il carattere -> [(foreground) + (background)] + [ASCII CODE].
; [] = 1 byte.
; () = 4 bit.

org 100h

mov ax, 0b800h ; copiamo l'indirizzo di memoria del segmento della memoria grafica in ax.
mov es, ax     ; facciamo puntare al registro di segmento es l'indirizzo di memoria del segmento della memoria grafica.
mov ah, 01001110b  ; usiamo gli 8 bit del registro ah per metterci i colori di foreground e di background
mov al, 'A'        ; utilizziamo gli 8 bit del registro al per mettere il codice ascii o il carattere.

mov es:[00h], ax   ; mandiamo tutto il registro ax all'indirizzo di memoria 00h del segmento della memoria grafica.

ret