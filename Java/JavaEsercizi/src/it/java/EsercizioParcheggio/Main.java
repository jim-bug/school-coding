package it.java.EsercizioParcheggio;
import java.time.LocalTime;
import java.util.Random;
import java.util.Scanner;
public class Main {
	public static void main(String[] args) {
		int numeroDiAuto = getInputInt("Inserisci il numero di macchine: ");
		int numeroPostiParcheggio = getInputInt("Inserisci il numero di posti: ");
		Auto[] macchine = new Auto[numeroDiAuto];
		Parcheggio viaRossi = new Parcheggio(numeroPostiParcheggio);
		LocalTime orarioFinale;
		Random rand = new Random();
		String continua = "";
		String marca = "";
		String modello = "";
		String targa;
		int oreFinale;
		int minutiFinali = 0;
		int secondiFinali = 0;
		
		for(int i = 0; i < numeroDiAuto; i++) {
			marca = getInputString("Inserisci la marca dell'auto numero " + i);
			modello = getInputString("Inserisci il modello dell'auto numero " + i);
			targa = getInputString("Inserisci la targa dell'auto numero " + i);
			macchine[i] = new Auto(marca, modello, targa);
		}
		if(numeroDiAuto <= 0) {
			System.out.println("Macchine insufficenti, non puoi posteggiare nulla!");
		}
		else {
			int contaAuto = 0;
			int[] autoAncoraDisponibili = new int[numeroDiAuto];
			int[] autoPosteggiate = new int[numeroDiAuto];
			for(int i = 0;i < numeroDiAuto;i++) {
				autoAncoraDisponibili[i] = i;
				autoPosteggiate[i] = -1;
			}
			do {
				int scelta = getInputInt("Scegli l'operazione da fare: \n0) Parcheggiare un auto\n1) Pagare il posteggio(quindi uscire)\n2) Visualizzare resoconto\n");
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
							elencaAuto(macchine, autoPosteggiate, numeroDiAuto);
							int numeroAssociatoAuto = getInputInt("Tra le macchine riportate qui sopra quale deve uscire?");
							oreFinale = rand.nextInt(((23 - LocalTime.now().getHour() + 1) + 1)) + LocalTime.now().getHour() + 1;
							minutiFinali = rand.nextInt((59 - 1) + 1) + 1;
							secondiFinali = rand.nextInt((59 - 1) + 1) + 1;
							orarioFinale = LocalTime.of(oreFinale,  minutiFinali, secondiFinali);
							System.out.println(viaRossi.toString(macchine[numeroAssociatoAuto], orarioFinale));
							float importo = getInputInt("Inserisci l'importo: ");
							viaRossi.pagaParcheggio(importo, macchine[numeroAssociatoAuto], orarioFinale);
							autoAncoraDisponibili[numeroAssociatoAuto] = numeroAssociatoAuto;
							autoPosteggiate[numeroAssociatoAuto] = -1;
						}
						else {
							System.out.println("Non ci sono macchine nel parcheggio!");
						}
						break;
					case 2:
						System.out.println(viaRossi.toString());
						break;
						
					default:
						System.out.println("Nessuna delle opzione scelta è valida!");
				}
				continua = getInputString("Vuoi continuare?");
		}
		while(continua.equals("si"));
		}
		/*
		 * Overload e Override:
		 * Override stessa firma del metodo, cambia il corpo.
		 * Overload, può cambiare il tipo di parametri, tipo di ritorno.
		 * 
		 * Nodi: composto da un valore e un link al prossimo valore.
		 * Lista dinamica: insieme finito di nodi.
		 * 
		 * */
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
			System.out.println(i + " " + veic[elenco[i]]);
		}
	}
}
