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

import java.net.ServerSocket;
import java.net.Socket;
import java.io.IOException;
import java.util.Random;


/**
 * Classe che modella un server del SuperEnalotto, ad ogni connessione chiusa associa un thread ad essa per l'estrazione.
 * 
 * @author jim_bug
 * @see ServerSocket
 * @see Socket
 */
public class Server {
	private static final short PORT = 8768;
	private static final int LENGTH = 6;
	private ServerSocket server;
	
	
	public Server() {
		this.open();
	}
	
	
	private void open() {
		try {
			server = new ServerSocket(PORT);
//			Integer[] numbers = this.generateNumbers();
			while(true) {
				Socket client = server.accept();
				System.out.println("\nClient is connected "+ client.toString());
				
				Integer[] numbers = this.generateNumbers();
				for(Integer i : numbers) {
					System.out.print(i + " ");
				}
				new ClientThread(client, numbers, LENGTH);
					
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	 // Metodo che genera i numeri del server in maniera casuale, tutti diversi. 
	private Integer[] generateNumbers() {
		Random rand = new Random();
		Integer[] numbers = new Integer[LENGTH+1];
		
		for(int i = 0; i < LENGTH+1;i++) {
			Integer temp = rand.nextInt(90);
			while(search(temp, numbers)) {
				temp = rand.nextInt(90);
			}
			numbers[i] = temp;
			
		}
		return numbers;
	}
	
	private boolean search(Integer key, Integer[] array) {
		for(int i = 0; i < array.length; i++) {
			if(array[i] == key) {
				return true;
			}
		}
		return false;
	}
}
// :)
