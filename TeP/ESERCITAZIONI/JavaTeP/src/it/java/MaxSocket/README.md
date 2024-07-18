# Esercizio Sui Socket n. 1

![Licenza](https://img.shields.io/badge/license-GNU-blue.svg)
![Versione](https://img.shields.io/badge/version-1.0.0-green.svg)

## Index

- [Introduzione](#introduzione)
- [Analisi](#analisi)
- [Uso](#uso)
- [Licenza](#licenza)
- [Contatti](#contatti)


## Introduzione

L'esercizio consiste nel realizzare un progetto software client-server, dove il server, ad ogni numero, intero, che invia il client deve restituire il massimo dei numeri ricevuti. L'esercizio aggiunge un caso dove se il client invia un numero negativo, il massimo viene reimpostato a 0. Consegna comepleta su "esercizio.pdf"

NOTA:
Non è richiesto, ma aggiungo io un requisito: Il server deve poter fornire il servizio a più client connessi conteporaneamente.

## Analisi

Per la risoluzione di questo esercizio ho optato per 4 classi:

- **Classe Client**: Classe dedicata al client side.
- **Classe Server**: Classe dedicata al server side.
- **Classe ThreadContent**: Classe dedicata al requisito aggiuntivo. Questa classe si occuperà di avviare il thread corrispondente al client appena connesso. Estende Thread.
- **Classe Main**: Classe usata per istanziare le classi Client e Server

Ho scelto di programmare un StreamSocket, quindi un socket che utilizza il [TCP](https://www.ietf.org/rfc/rfc793.txt) come protocollo di trasporto.
La classe che conterrà la ricerca del massimo sarà la ThreadContent, tutta la logica relativa alla ricerca del massimo di una sequenza si troverà dentro al metodo .run(), metodo dove la sua dichiarazione nell'Interfaccia [Runnable](https://docs.oracle.com/javase/8/docs/api/java/lang/Runnable.html) implementata da [Thread](https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html). In questo modo appena chiamo il metodo .start() di ThreadContent si avvierà un nuovo flusso di esecuzione (thread), eseguendo tutto il contenuto di .run(). 

Infine nella classe Server, ho messo in ascolto il server side socket e nel momento in cui un client si connette, effettuo un istanza della classe ThreadContent passandogli come argomento al costruttore l'oggetto Socket relavito al client appena connesso.
In questo modo il server può fornire lo stesso servizio a più client conteporaneamente, grazie ad un approccio multithreading.

## Uso


```bash
# To compile:
cd it/java/MaxSocket
javac -d . Server.java ThreadContent.java Client.java Main.java
```
```bash
# To execute as a client:
java it.java.MaxSocket.Main -c IP 4444
```
```bash
# To execute as a server:
java it.java.MaxSocket.Main -s
```

### Note:
Il parametro IP si riferisce all'ip del server.

## Licenza

[GPL-3.0](https://choosealicense.com/licenses/gpl-3.0/)


## Contatti
Puoi contattarmi presso questo indirizzo email -> ignazioandsperandeo@gmail.com