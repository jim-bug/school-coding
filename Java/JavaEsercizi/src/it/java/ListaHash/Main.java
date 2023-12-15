package it.java.ListaHash;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		int dimensioneTabella = getIntInput("Inserisci la dimensione della tabella HASH: ");
		Lista[] structure = new Lista[dimensioneTabella];
		for(int i = 0;i < dimensioneTabella; i++) {
			structure[i] = new Lista();
		}
		for(int i = 0;i < dimensioneTabella; i++) {
			String key = getStrInput("Inserisci la chiave numero " + i);
			String value = getStrInput("Inserisci il valore numero " + i);
			int h = hash(key, dimensioneTabella);
			System.out.println(h);
			structure[h].inserisci(key, value);
			System.out.println("Funzione hash della chiave " + key + " : " + h);
		}
		
		for(int i = 0; i < dimensioneTabella; i++) {
			System.out.println("Array: " + i);
			structure[i].stampa();
		}
		
	}
	public static String getStrInput(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
	public static int getIntInput(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		while(!input.hasNextInt()) {
			System.out.println("Dato ERRATO " + message);
			input.next();
		}
		return input.nextInt();
	}
	public static int hash(String info, int dimensioneTabella) {
		int h = 0;
		for(int i = 0;i < info.length(); i++) {
			h += info.charAt(i);
		}
		return h % dimensioneTabella;
	}
}
