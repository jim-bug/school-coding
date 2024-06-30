/*
 * Autore: Ignazio Leonardo Calogero Sperandeo
 * Data: 30/06/2024
 * Consegna:Realizzare un'applicazione client-server che simuli il Superenalotto. Il client deve inviare 6
			numeri al server ed esso risponderà con 6 numeri estratti casualmente (+1 numero jolly) e
			deve verificare le corrispondenze tra i numeri inviati dal client e quelli inviati dal server. In
			base alla quantità di numeri indovinati dal client (3, 4, 5, 5+jolly o 6 numeri) allora viene
			vinta una somma in denaro. I numeri sono casuali e vanno da 1 a 90.
 * by jim_bug :)
 */

package it.java.SuperEnalotto;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client {
	private String serverAddress;
	private short portServer;
	private String sequence;
	
	public Client(String serverAddress, short portServer, String sequence) {
		setServerAddress(serverAddress);
		setPortServer(portServer);
		setSequence(sequence);
		this.open();
	}
	
	public void setServerAddress(String serverAddress) {
		this.serverAddress = serverAddress;
	}
	
	public String getServerAddress() {
		return this.serverAddress;
	}

	public short getPortServer() {
		return portServer;
	}

	public void setPortServer(short portServer) {
		this.portServer = portServer;
	}

	public String getSequence() {
		return sequence;
	}

	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	
	private void open() {
		try {
			Socket client = new Socket(serverAddress, portServer);
			PrintWriter out = new PrintWriter(client.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(client.getInputStream()));
            
            out.println(sequence);
            System.out.println(in.readLine());
            
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
}
// :)
