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
			for(int i = 0;i < numeroDiAuto;i++) {
				if(viaRossi.controlloDisponibilita()) {
					viaRossi.assegnaPosto(macchine[i]);
					ore = rand.nextInt((21 - LocalTime.now().getHour()+1) + 1) + LocalTime.now().getHour()+1;
					minuti = rand.nextInt((59 - 1) + 1) + 1;
					secondi = rand.nextInt((59 - 1) + 1) + 1;
					ora = LocalTime.of(ore, minuti, secondi);
					float verificaPrezzo = viaRossi.calcolaPrezzo(macchine[i], ora);
					System.out.println("Importo da pagare: " + Math.round(viaRossi.calcolaPrezzo(macchine[i], ora)) + "€" + " " + verificaPrezzo);
				}
				else {
					System.out.println("Posti attualmente insufficenti!");
				}
			}
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
}
