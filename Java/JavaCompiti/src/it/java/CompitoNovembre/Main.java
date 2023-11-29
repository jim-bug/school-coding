package it.java.CompitoNovembre;
import java.util.Scanner;

import java.time.LocalDate;
import java.util.Random;

public class Main {
	// 	PREMESSA: non è il codice consegnato in classe, questo codice è stato revisionato e aggiustato subito dopo la verifica.
	/*
	 * per generare un numero casuale da min a max si fa nella seguente maniera:
	 * int num = random.nextInt(max - min + 1) + min
	 * 
	 * */
	
	public static void main(String[] args) {
		int numeroPassegeri = getIntInput("Inserisci il numero di passegeri: ");
		int numeroVoli = getIntInput("Inserisci il numero di voli: ");
		int numeroVolo = 0;
		int voliPerPassegero = 0;
		int giorno = 0;
		int mese = 0;
		int anno = 0;
		String destinazione = "";
		String nome = "";
		String cognome = "";
		LocalDate dataDiPartenza = LocalDate.now();
		Random random = new Random();
		Passegero[] passegeri = new Passegero[numeroPassegeri];
		Volo[] voli = new Volo[numeroVoli];
		CompagniaAerea ita = new CompagniaAerea(numeroVoli, numeroPassegeri);
		for(int i = 0;i < numeroVoli;i++) {
			destinazione = getStringInput("Inserisci la destinazione del volo " + i + ": ");
			int temp = LocalDate.now().getMonthValue();
			giorno = random.nextInt(31 - 1 + 1) + 1;
			anno = random.nextInt(2024 - 2023 + 1) + 2023;
			if(anno == 2023) {
				mese = random.nextInt(12 - (temp+1) + 1) + temp; // un volo al massimo può essere fissato da un mese dalla data corrente(se l'anno coincide)
			}
			else {
				mese = random.nextInt(12 - 1 + 1) + 1;
			}
			dataDiPartenza = LocalDate.of(anno, mese, mese);
			voli[i] = new Volo(i, destinazione, dataDiPartenza, 500);	// impongo(in hardcode) che i posti liberi siano 500 per volo.
			ita.aggiungiVolo(voli[i]);
		}
		ita.getElencoVoli();
		for(int i = 0;i < numeroPassegeri;i++) {
			nome = getStringInput("Inserisci il nome del passegero " + i + ": ");
			cognome = getStringInput("Inserisci il conome del passegero " + i + ": ");
			passegeri[i] = new Passegero(nome, cognome, i);
			voliPerPassegero = getIntInput("Quanti voli vuoi prenotare per " + nome + ": ");
			while(voliPerPassegero > numeroVoli) {	// non posso prenotare per passeggero più voli di quanti sono stati publicati.
				System.out.println("Al momento si dispone di " + numeroVoli + " massimi, riprova: ");
				voliPerPassegero = getIntInput("Quanti voli vuoi prenotare per " + nome + ": ");
			}
			for(int j = 0;j < voliPerPassegero;j++) {
				numeroVolo = getIntInput("Inserisci la prenotazione " + j + " per " + nome + ": ");
				passegeri[i].prenotaVolo(numeroVolo, voli[numeroVolo]);
			}

		}
		for(int i = 0;i < numeroPassegeri;i++) {
			ita.aggiungiPassegero(passegeri[i]);
		}
		ita.getElencoPassegeri();
		
		
		
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
