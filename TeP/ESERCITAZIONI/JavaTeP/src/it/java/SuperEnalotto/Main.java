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

public class Main {

	public static void main(String[] args) {
		if(args[0].equalsIgnoreCase("-s")) {
			new Server();
		}
		else if(args[0].equalsIgnoreCase("-c")) {
			new Client(args[1], Short.parseShort(args[2]), args[3]);
		}
		else {
			System.out.println("Check option -s or -c!");
		}

	}

}
// :)
