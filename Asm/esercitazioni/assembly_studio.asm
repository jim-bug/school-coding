org 100h
 
 ; commenti in assembly

; struttura istruzioni assembly:

; [etichetta] COP  [destinazione, [sorgente]]  ; commento

; il COP significa codice operativo ma si dice codice mnemonico, il COP può avere al massimo due parametri.

; istruzioni fino ad ora fatte in assembly:

mov ax, 5  ; copia la costante 5 nel registro ax
; alle costanti può essere associato il sistema di numerazione:

; 010101b -> binario
; 5Ah -> esadecimale
; 27o -> ottale
; 34 -> decimale

mov ax, bx ; copiamo il contenuto di bx in ax
mov ah, ch ; copio il contenuto di ch in ah
mov ah, bx ; SBAGLIATO, perche stiamo copiando un dato a 16 bit in un registro a 8 bit
; -----

add ax, 5 ; sommo il contenuto di ax con la costante 5 e lo copio in ax
add bx, ax ; sommo il contenuto di bx e ax e lo copio in bx
add 5, ax ; SBAGLIATO perche non posso copiare il risultato di una qualsiasi operazione in una costante

; sub e lo stesso concetto di add solo che sottrae
; ---

inc ax  ; incremento di 1 il registro ax
inc bx  ; incremento di 1 il registro bx
dec ax  ; decremento di 1 il registro ax
dec bx  ; decremento di 1 il registro ax

; poi abbiamo visto gli operatori logici:
; AND operatore binario
; OR  operatore binario
; NOT operatore unario
; XOR, operatore binario, utile per azzerare i registri, per utilizza meno byte

;  istruzione JMP ossia il salto(jump)

; questi COP vengono preceduti da CMP ossia confronto

JA 	;   Salta se maggiore nel caso di numeri naturali
JAE ;   Salta se maggiore o uguale con numeri naturali
JB 	;   Salta se minore nel caso di numeri naturali
JBE ;   Salta se minore o uguale nel caso di numeri naturali
JC 	;   Salta se il carry è settato
JCXZ;   Salta se il registro CX è uguale a zero
JE 	;   Salta se gli operandi sono uguali
JG 	;   Salta se maggiore con i numeri interi
JGE ;   Salta se maggiore o uguale con i numeri interi
JL 	;   Salta se minore con i numeri interi
JLE ;   Salta se minore o uguale con i numeri interi
JNC ;	Salta se i carry è resettato
JNE ;	Salta se diverso
JNO ;	Salta se non c’è overflow
JNS ;	Salta se il segno è positivo
JO 	;   Salta se c’è overflow
JS 	;   Salta se il segno è negativo
JPE ;	Salta se la parità è pari
JPO ;	Salta se la parità è dispari 

; esempio,m vogliamo incrementare il registro ax per 10 volte:
xor cx, cx ; azzeriamo il contatore
op:
   inc ax   ; incremento ax 
   inc cx  ; incremento cx
cmp cx, 000Ah ; quindi faccio il confronto tra cx e 10 e itero l'etichetta op finche cx e diverso da 10
jne   op

ret  ; corrsponde alla fine del programma
