; Fatto da Ignazio Sperandeo
; realizzare un programma in assemblt che faccia la somma dei numeri da 1 a 93: 
org 100h

xor cx, cx  ; azzero il registro counter
somma:
    inc cx  ; incremento il registro, per poi sommarlo al registro ax.
    add ax, cx

cmp cx, 93 ; faccio il confronto, tra il contatore e 93, perchè il cx mi conta anche quante somme stp facendo.
jne somma  ; e verifico se il confronto non e uguale a 93 se lo e mi fermo
    

ret