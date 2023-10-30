package it.java.EsercizioParcheggio;
import java.time.LocalTime;
import java.util.Random;
import java.util.Scanner;
import java.lang.Math;
public class Main {

	public static void main(String[] args) {
		int numeroDiAuto = getInputInt("Inserisci il numero di macchine: ");
		int numeroPostiParcheggio = getInputInt("Inserisci il numero di posti: ");
		Auto[] macchine = new Auto[numeroDiAuto];
		Parcheggio viaRossi = new Parcheggio(numeroPostiParcheggio);
		LocalTime ora;
		Random rand = new Random();
		String sceltaUscitaParcheggio = "";
		String continua = "";
		String marca = "";
		String modello = "";
		String targa = "";
		int ore = 0;
		int minuti = 0;
		int secondi = 0;
		
		for(int i = 0; i < numeroDiAuto; i++) {
			marca = getInputString("Inserisci la marca dell'auto numero " + i);
			modello = getInputString("Inserisci il modello dell'auto numero " + i);
			targa = getInputString("Inserisci la targa dell'auto numero " + i);
			macchine[i] = new Auto(marca, modello, targa);
		}
		if(numeroDiAuto == 0) {
			System.out.println("Macchine insufficenti, non puoi posteggiare nulla!");
		}
//		macchine[0] = new Auto("Audi", "R8", "AF 123ER");
//		macchine[1] = new Auto("Audi", "A5", "IO 667UI");
//		macchine[2] = new Auto("Alfa Romeo", "Giulia", "RM 444RF");
//		macchine[3] = new Auto("Alfa Romeo", "Stelvio", "HH 562JK");
//		macchine[4] = new Auto("Tesla", "Model S", "JI 111MB");
		else {
			int contaAuto = 0;
			int[] autoAncoraDisponibili = new int[numeroDiAuto];
			int[] autoPosteggiate = new int[numeroDiAuto];
			for(int i = 0;i < numeroDiAuto;i++) {
				autoAncoraDisponibili[i] = i;
			}
			do {
				int scelta = getInputInt("Scegli l'operazione da fare: \n1) Parcheggiare un auto(0)\n2) Pagare il posteggio(quindi uscire)(1)\n");
				switch (scelta) {
					case 0:
						elencaAuto(macchine, autoAncoraDisponibili, numeroDiAuto);
						int autoDaPosteggiare = getInputInt("Tra le auto riportate qui sopra quale deve posteggiare: ");
						if(viaRossi.controlloDisponibilita()) {
							viaRossi.assegnaPosto(macchine[autoDaPosteggiare]);
							autoPosteggiate[autoDaPosteggiare] =  autoAncoraDisponibili[autoDaPosteggiare]; // assegno al vettore delle macchine che hanno posteggiato la macchina che ha appena posteggiato
							autoAncoraDisponibili[autoDaPosteggiare] = -1; // key che definisce che la macchina è posteggiata
							contaAuto ++;
						}
						else {
							System.out.println("Posti esauriti!");
						}
						break;
					case 1:
						if(contaAuto >= 1) {
							sceltaUscitaParcheggio = getInputString("Qualche macchina deve uscire?");
							if(sceltaUscitaParcheggio.equals("si")) {
								elencaAuto(macchine, autoPosteggiate, numeroDiAuto);
								int numeroAssociatoAuto = getInputInt("Tra le macchine riportate qui sopra quale deve uscire?");
								ora = LocalTime.of(23, 59, 15);
								System.out.println(viaRossi.toString(macchine[numeroAssociatoAuto], ora));
								int importo = getInputInt("Inserisci l'importo: ");
								viaRossi.pagaParcheggio(importo, macchine[numeroAssociatoAuto], ora);
								autoAncoraDisponibili[numeroAssociatoAuto] = numeroAssociatoAuto;
								autoPosteggiate[numeroAssociatoAuto] = -1;
							}
						}
						else {
							System.out.println("Non ci sono macchine nel parcheggio!");
						}
						break;
					default:
						System.out.println("Nessuna delle opzione scelta è valida!");
				}
				continua = getInputString("Vuoi continuare?");
		}
		while(continua.equals("si"));
		}
		// System.out.println(viaRossi.toString());
		
	}
	public static String getInputString(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
	public static int getInputInt(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		while(!input.hasNextInt()) {
			System.out.println("Tipo di dato errato!!!\nInserisci di nuovo: ");
			input.next();
		}
		return input.nextInt();
	}
	public static void elencaAuto(Auto[] veic, int[] elenco, int numeroAuto) {
		for(int i = 0;i < numeroAuto;i++) {
			if(elenco[i] == -1) {
				continue;
			}
			System.out.println(veic[elenco[i]]);
		}
	}
}
