/*
 * Autore: Ignazio Leonardo Calogero Sperandeo.
 * Data: 1807/2024
 * Consegna: consulta il file "esercizio.pdf"
 * 
 * by jim_bug :)
 * */

package it.java.MaxSocket;

import java.net.ServerSocket;
import java.net.Socket;
import java.io.IOException;

public class Server{
	private static final short PORT = 4444;
	private ServerSocket server;
	private int currentConnectedClients;
	public Server() {
		this.currentConnectedClients = 0; 
		this.open();
	}
	
	private void open() {
		try {
			server = new ServerSocket(PORT);
			while(true) {
				Socket client = server.accept();
				currentConnectedClients ++;
				System.out.println("Client connesso al server, IP: " + client.getInetAddress() + " Porta: " + client.getPort() + " Client connessi fino ad ora: " + currentConnectedClients);
				new ThreadContent(client);
			} 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
// :)
