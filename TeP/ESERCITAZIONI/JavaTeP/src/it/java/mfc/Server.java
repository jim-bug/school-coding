package it.java.mfc;

import java.net.ServerSocket;
import java.net.Socket;
import java.io.IOException;


/**
 * Classe che modella un server per l'invio di un messaggio al client.
 * 
 * @author mfcGroup
 * @see java.net.ServerSocket
 * @see java.net.Socket
 * @see java.io.IOException
 */
public class Server {
	private short port;
	private ServerSocket server;
	private int counter = 0;
	
	
	/**
	 * Metodo costruttore che istanzia un nuovo server in ascolto su una porta specificata.
	 * 
	 * @param port - Numero di porta su cui dovrà ascoltare il server.
	 * */
	public Server(short port) {
		setPort(port);
		this.open();
	}
	
	public short getPort() {
		return port;
	}


	public void setPort(short port) {
		this.port = port;
	}

	/**
	 * Mette in ascolto il server su una porta e rimane in attesa di connessioni, 
	 * alla connessione il server creerà un thread per il client connesso che si occuperà di interagire con il client associato.
	 * 
	 * @throws IOException se si verifica un errore durante l'apertura del socket.
	 * */
	private void open() {
		try {
			server = new ServerSocket(this.port);
			System.out.println("Server in attesa di connessioni.....");
			while(true) {
				Socket client = server.accept();
				counter ++;
				System.out.println("\nClient connesso: " + client.toString() + " n. " + counter);
				
				new ClientHandler(client);
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}
}
// :) 
