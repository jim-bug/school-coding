package it.java.Liste;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Lista lista = new Lista();
		lista.inserisci("1");
		lista.inserisci("9");
		lista.inserisci("4");
		lista.inserisci("2");
		lista.inserisci("3");
		lista.stampa();
		lista.inserisci("50", 6);
		lista.inserisci("10", 7);
		lista.stampa();
		lista.stampa(7);
		
	}
	public static String getStrInput(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
}
