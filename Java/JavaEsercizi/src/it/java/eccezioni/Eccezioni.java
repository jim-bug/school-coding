package it.java.eccezioni;
import java.io.IOException;
import java.lang.*;
import java.util.Scanner;
/*
 * Eccezione è un comportamento che non è previsto ma che non possiamo gestire come un Errore.
 * Le eccezioni si gestiscono con il costrutto try catch.
 * Nei set è norma prevedere la gestione degli errori.
 * Eccezioni non controllate: sollevano un eccezione non controllata dal programmatore.b
 * Eccezioni controllate: vengono controllatre dal programmatore
 * */
public class Eccezioni {

	public static void stampa(int[] vet) throws ArrayIndexOutOfBoundsException{
		try {
			for(int i = 0;i < 5; i++) {
				System.out.println(vet[i]);
			}
		}
		catch(ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
			System.out.println("Sono dopo l'errore");
		}
	}
	public static void main(String[] args) {
		int[] vet = new int[4];
		for(int i = 0;i < 4;i++) {
			vet[i] = i;
		}
		stampa(vet);

	}

}
