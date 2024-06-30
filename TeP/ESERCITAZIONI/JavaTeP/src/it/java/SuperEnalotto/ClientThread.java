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


public class ClientThread extends Thread{
	private int lengthSequence;
	private Socket client;
	private Integer[] serverNumbers;
	private Integer[] clientNumbers;
	
	public ClientThread(Socket client, Integer[] serverNumbers, int lengthSequence) {
		setClient(client);
		setServerNumbers(serverNumbers);
		setLengthSequence(lengthSequence);
		this.clientNumbers = new Integer[lengthSequence];
		this.start();
	}

	
	public void run() {
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(client.getInputStream()));			// Client Read Stream
			PrintWriter ou = new PrintWriter(client.getOutputStream(), true);								// Client Write Stream
			
			String sequence;
			while((sequence = in.readLine()) != null) {
				convert(sequence.split(","));
				ou.println(checkNumbers());
			}
			
			
		} catch(IOException e) {
			try {
				client.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}	
	}

	

	public int getLengthSequence() {
		return lengthSequence;
	}


	public void setLengthSequence(int lengthSequence) {
		this.lengthSequence = lengthSequence;
	}


	public Socket getClient() {
		return client;
	}


	public void setClient(Socket client) {
		this.client = client;
	}


	public Integer[] getServerNumbers() {
		return serverNumbers;
	}


	public void setServerNumbers(Integer[] serverNumbers) {
		this.serverNumbers = serverNumbers;
	}


	private String checkNumbers() {
		int counter = 0;
		boolean jolly = false;
		int money = 0;
		
		
		for(int i = 0;i < lengthSequence; i++) {
			for(int j = 0; j < lengthSequence+1; j++) {
				if(clientNumbers[i].equals(serverNumbers[j])) {
					if(j == lengthSequence) {
						jolly = true;
					}
					counter ++;
					break;
				}
			}

		}
		switch(counter) {
			case 3:
				money += 5;
				break;
			case 4:
				money += 10;
				break;
			case 5:
				money += 15;
				break;
			case 6:
				if(jolly) {
					money += 25;
				}
				else {
					money += 20;
				}
				break;
		}
		
		
		return "You've won " + money + " dollars! Goodbye!\n";
	}
	
	private void convert(String[] clientNumbers) {
		for(int i = 0; i < lengthSequence; i++) {
			this.clientNumbers[i] = Integer.valueOf(clientNumbers[i]);
		}
	}
}
// :)
