# MyFirstConnection

![Licenza](https://img.shields.io/badge/license-GNU-blue.svg)
![Versione](https://img.shields.io/badge/version-1.0.0-green.svg)

## Index

- [Introduzione](#introduzione)
- [Analisi](#analisi)
- [Uso](#uso)
- [Licenza](#licenza)


## Introduzione

Sfruttando le conoscenze pregresse, negli anni precedenti e in quello in corso, realizzare un programma in Java che permetta la comunicazione tra due o più applicativi, sfruttando l'architettura Client/Server attraverso la rete. In particolare il Client deve ricevere un messaggio dal server.


## Analisi

Per la risoluzione di questo esercizio abbiamo optato per 4 classi:

- **Classe Client**: Classe dedicata al client side.
- **Classe Server**: Classe dedicata al server side.
- **Classe ThreadContent**: Questa classe si occuperà di avviare il thread corrispondente al client appena connesso.
- **Classe Main**: Classe usata per istanziare le classi Client e Server, in base alle opzioni fornite

Abbiamo scelto di programmare un StreamSocket, quindi un socket che utilizza il [TCP](https://www.ietf.org/rfc/rfc793.txt) come protocollo di trasporto.
La logica che si occuperà di inviare il messaggio al server si trova dentro al metodo .run(), metodo dove la sua dichiarazione nell'Interfaccia [Runnable](https://docs.oracle.com/javase/8/docs/api/java/lang/Runnable.html) implementata da [Thread](https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html). In questo modo appena verrà chiamato il metodo .start() di ClientHandler si avvierà un nuovo flusso di esecuzione (thread), eseguendo tutto il contenuto di .run(). 

Nella classe Server, nel momento in cui un Client si connette, viene effettuata un istanza della classe ThreadContent dando come argomento al costruttore l'oggetto Socket relativo al client appena connesso.
In questo modo il server può fornire lo stesso servizio a più client conteporaneamente, grazie ad un approccio multi-threading.

Nella classe Client, il costruttore, accetta come parametri l'IPv4 del server e il suo numero di porta. Eseguendo il metodo .start() l'istanza di un Client potrà connettersi al server.

## Uso


```bash
# To compile:
	javac  it/java/mfc/Server.java it/java/mfc/ClientHandler.java it/java/mfc/Client.java it/java/mfc/Main.java
```
```bash
# To execute as a client:
	java it.java.MaxSocket.Main -c IP port
```
```bash
# To execute as a server:
	java it.java.MaxSocket.Main -s port
```

```bash
# Help
	java it.java.MaxSocket.Main -h
# Or
	java it.java.MaxSocket.Main --help

```

### Note:
Il parametro IP si riferisce all'ip del server. Il parametro port si riferisce alla porta su sui ascolta il server.

## Licenza

[GPL-3.0](https://choosealicense.com/licenses/gpl-3.0/)
