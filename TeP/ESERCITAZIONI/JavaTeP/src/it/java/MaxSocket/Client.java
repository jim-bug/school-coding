/*
 * Autore: Ignazio Leonardo Calogero Sperandeo.
 * Data: 1807/2024
 * Consegna: consulta il file "esercizio.pdf"
 * 
 * by jim_bug :)
 * */

package it.java.MaxSocket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket; 
import java.util.Scanner;

public class Client {
	private String serverAddress;
	private short portServer;
	
	public Client(String serverAddress, short portServer) {
		setServerAddress(serverAddress);
		setPortServer(portServer);
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
	
	private void open() {
		try {
			Socket client = new Socket(serverAddress, portServer);
			PrintWriter out = new PrintWriter(client.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(client.getInputStream()));
            
            while(true) {
            	Integer num = intInput("Inserisci un numero da inviare al server: ");
                out.println(num.toString());
                System.out.println(in.readLine());
            }

            
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	private int intInput(String message) {
		Scanner stream = new Scanner(System.in);
		System.out.println(message);
		while(!stream.hasNextInt()) {
			System.out.println("Retry " + message);
			stream.next();
		}
		return stream.nextInt();
	}
	
	
}
// :)
