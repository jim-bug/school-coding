# CALCOLO CHIAVI RSA


## INDICE

- [Introduzione](#introduzione)
- [Analisi](#analisi)
- [Uso](#uso)
- [Contatti](#conatti)
- [Autore](#autore)


## Introduzione
Realizzare un foglio di calcolo in grado di calcolare due chiavi: Pubblica e Privata. Utilizzando una macro.
## Analisi
Per calcolare la coppia di chiavi Pubblica e Privata, bisogna seguire una serie di calcolo:

- **Scegliere due numeri a e b diversi primi**
- **Calcolare il modulo n attraverso la formula: ```n = a * b```**
- **Calcolare z attraverso la formula: ```z = (a - 1) * (b - 1)```**
- **Scegliere un numero ``` 2 < pri < z``` primo, tale sarà la chiave privata**
- **Calcolare l'inverso moltiplicativo: ``` pub * pri = 1 % z``` per trovare la chiave pubblica, consiglio di usare: l'agoritmo di euclide esteso**


Seguiti questi passaggi si può cominciare a criptare il messaggio:

``` C = m^pub % n```
Dove m è il codice associato a quel carattere, basato su un certo alfabeto. Questa formula si applica per tutti i codici dei caratteri del messaggio da criptare.

Per decriptare il messaggio, codice dopo codice, si utilizza:

``` m = C^pri % n```

Ho codificato questo algoritmo nel file: macro.py. Utizzandolo come macro per un foglio di calcolo gestisto con libreoffice calc.
## Uso
Se non è già installato:
```bash
sudo apt-get install libreoffice-script-provider-python -y
```
Infine spostare la macro nella posizione del file system: 
```bash
/home/($whoami)/.config/libreoffice/4/user/Scripts/python
```
(se Scripts/ e python/ non esistono potete crearle) e da libreoffice calc selezionare la macro desiderata.

## Contatti
Puoi contattarmi presso questo indirizzo email -> ignazioandsperandeo@gmail.com

## Autore
Svolto da Ignazio Leonardo Calogero Sperandeo in data 09/10/2024 a scopo didattico e formativo. By jim_bug // :)
