/*
 * Autore: Ignazio Leonardo Calogero Sperandeo
 * Data: 31/01/2024
 * Esercizio: Progettare un software che possa gestire la ditta di trasporti di un azienda. 
 * Il software deve prevedere l'istanza di un oggetto Magazzino, la classe Magazzino, oltre ai metodi getter e setter e il costruttore, deve poter registrare ogni camion che deve partire. 
 * Il camion ha una destinazione, un peso di carico, il tipo di carico(fragile ecc..), un tempo stimato di arrivo, il tempo stimato di arrivo dipende dalla destinazione. 
 * Per determinare il tempo stimato é necessario conoscere la velocità media del veicolo e la distanza della destinazione. 
 * Implementare una classe Cliente che abbia l'anagrafica di ogni cliente.
 * Implementare il diagramma UML delle classi e una classe Main che simuli dei trasporti.
 * 
 * */
package it.java.Eccezioni;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Magazzino zonaIndustriale = new Magazzino();
		String sceltaOperazioni = "";
		while(!sceltaOperazioni.equalsIgnoreCase("ESC")) {
			sceltaOperazioni = getInputStr("#########MENU##########\n\t1) Compila un trasporto\n\t2) Visualizza carichi camion\n\t3) Fai partire un camion\nScegli cosa vuoi fare: ");
			switch(sceltaOperazioni.charAt(0)) {
				case '1':
					zonaIndustriale.addTrasporto();
					break;
				case '2':
					zonaIndustriale.getCarichiCamion();
					break;
				case '3':
					zonaIndustriale.parti();
					break;
				default:
					System.out.println("Input non valido");
			}
		}
	}
	
	private static String getInputStr(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
}
