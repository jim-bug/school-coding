package it.java.Liste;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Lista lista = new Lista();
		int numeroNodi = 5;
		for(int i = 0;i < numeroNodi;i ++) {
			lista.inserisci(getStrInput("Inserisci il nodo alla posizione " + i + ": "));
		}
		lista.stampa();
		
	}
	public static String getStrInput(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
}
