package it.java.CompitoNovembre;
import java.util.Scanner;
import java.time.LocalDate;
public class Main {

	public static void main(String[] args) {
		int numeroPassegeri = getIntInput("Inserisci il numero di passegeri: ");
		int numeroVoli = 3;
		int numeroVolo = 0;
		String destinazione = "";
		String nome = "";
		String cognome = "";
		LocalDate dataDiPartenza = LocalDate.now();
		Passegero[] passegeri = new Passegero[numeroPassegeri];
		Volo[] voli = new Volo[numeroVoli];
		CompagniaAerea ita = new CompagniaAerea();
		for(int i = 0;i < numeroVoli;i++) {
			destinazione = getStringInput("Inserisci la destinazione del volo " + i + ": ");
			dataDiPartenza = LocalDate.now();	// momentaneamente in hardcode
			voli[i] = new Volo(i, destinazione, dataDiPartenza, 500);
		}
		for(int i = 0;i < numeroVoli;i++) {
			System.out.println(voli[i].getDestinazione() + " di volo " + i);
			ita.aggiungiVolo(voli[i]);
		}
		for(int i = 0;i < numeroPassegeri;i++) {
			nome = getStringInput("Inserisci il nome del passegero " + i + ": ");
			cognome = getStringInput("Inserisci il conome del passegero " + i + ": ");
			numeroVolo = getIntInput("Inserisci il numero di volo: ");
			passegeri[i] = new Passegero(nome, cognome, i);
			passegeri[i].prenotaVolo(numeroVolo, voli[numeroVolo]);
		}
		for(int i = 0;i < numeroPassegeri;i++) {
			passegeri[i].getDatiVolo();
			ita.aggiungiPassegero(passegeri[i]);
		}
		for(int i = 0;i < numeroVoli;i++) {
			ita.aggiungiVolo(voli[i]);
		}
		ita.getElencoPassegeri();
		ita.getElencoVoli();
		
		
	}
	public static int getIntInput(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		while(!input.hasNextInt()) {
			System.out.println("Inserisci di nuovo il tipi di dato: ");
			input.next();
		}
		return input.nextInt();
	}
	public static String getStringInput(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}

}
