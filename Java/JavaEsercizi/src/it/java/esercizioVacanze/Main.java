/*
 * Autore: Ignazio Leonardo Calogero Sperandeo
 * Data: 07/01/2024
 * Consegna: guarda file consegna.txt
 * by jim_bug :)
 * 
 * */
package it.java.esercizioVacanze;
import java.util.Scanner;
public class Main {

	public static void main(String[] args) {
		User persona = new User();
		Garage viablu = new Garage();
		if (persona.login()) {
			Scanner input = new Scanner(System.in);
			boolean state = true;
			while (state){
				System.out.println("##########MENU##########\nA) Stampa resoconto garage\nB) Fai entrare un veicolo\nC) Fai uscire un veicolo\nD) Stampo quanti veicoli ci sono dentro il garage\nE) Termini il programma");
				char scelta = input.nextLine().charAt(0);
				switch (scelta) {
					case 'A':
						viablu.mappaGarage();
						break;
					case 'B':
						viablu.ingresso();
						break;
					case 'C':
						System.out.println("Inserisci la targa per far uscire il veicolo: ");
						String targa = input.nextLine();
						viablu.uscita(targa);
						break;
					case 'D':
						System.out.println("Auto nel garage: " + viablu.getContaAuto());
						break;
					case 'E':
						System.out.println("Esecuzione finita!");
						state = !state;
						break;
				}
			}
		}
	}
}
