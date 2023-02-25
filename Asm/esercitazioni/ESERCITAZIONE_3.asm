org 100h
; realizzare un programma in assemblt che faccia la somma dei numeri da 1 a 93:  

xor cx, cx
somma:
    inc cx
    add ax, cx

cmp cx, 93 ; faccio il confronto
jne somma  ; e verifico se il confronto non e uguale a 93 se lo e mi fermo
    

ret