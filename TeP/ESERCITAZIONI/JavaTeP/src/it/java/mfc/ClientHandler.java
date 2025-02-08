package it.java.mfc;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

/**
 * Classe che si occupa di creare il thread associato al client che si connette al server, si occupa di inviare il messaggio di benvenuto al client.
 * 
 * @author mfcGroup
 * @see java.io.BufferedReader
 * @see java.io.IOException
 * @see java.io.InputStreamReader
 * @see java.io.PrintWriter
 * @see java.net.ServerSocket
 * @see java.net.Socket
 */

public class ClientHandler extends Thread{
	private Socket client;

	/**
	 * Metodo costruttore che istanzia un thread associato ad un client, in grado di interagirci.
	 * 
	 * @param client - L'istanza della classe Socket del client associato.
	 * */
	public ClientHandler(Socket client) {
		setClient(client);
		this.start();
	}

	/**
	 * Metodo che si occupa di mandare e ricevere il messaggio dal client.
	 * 
	 * @throws In caso di errori con l'invio e la ricezione dei messaggi o per chiudere la connessione.
	 * */
	public void run() {
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(client.getInputStream()));			// Client Read Stream
			PrintWriter ou = new PrintWriter(client.getOutputStream(), true);								// Client Write Stream
			
			String sequence = "Benvenuto nel server , ecco le tue informazioni: " + client.toString();
			ou.println(sequence);
			
			/*
			while((sequence = in.readLine()) != null) {
				convert(sequence.split(","));
				ou.println(checkNumbers());
			}
			*/
			
			
		} catch(IOException e) {
			try {
				client.close();
				
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		System.out.println("Connessione chiusa dal client: " + client.toString());
	}


	public Socket getClient() {
		return client;
	}


	public void setClient(Socket client) {
		this.client = client;
	}

}
// :)
