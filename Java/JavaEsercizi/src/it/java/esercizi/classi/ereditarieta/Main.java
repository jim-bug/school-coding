package it.java.esercizi.classi.ereditarieta;
import java.util.Scanner;


public class Main {
    public static void main(String[] args){
        int numeroRuote = getIntInput("Inserisci il numero di ruote: ");
        int numeroFinestrini = getIntInput("Inserisci il numero di finestrini: ");
        int numeroAirBag = getIntInput("Inserisci il numero di AirBag: ");
        int numeroPorte = getIntInput("Inserisci il numero di porte: ");
        int numeroFari = getIntInput("Inserisci il numero di fari: ");
        int numeroPosti = getIntInput("Inserisci il numero di posti: ");
        int numeroSpecchietti = getIntInput("Inserisci il numero di specchietti: ");
        float velocitaMax = getFloatInput("Inserisci la massima velocità: ");
        String cilindrata = getStringInput("Inserisci la cilidrata: ");
        String coloreVeicolo = getStringInput("Inserisci il colore del veicolo: ");
        String tipoCarburante = getStringInput("Inserisci il tipo di carburante");
        String tipoMotore = getStringInput("Inserisci il tipo di motore: ");

    	Veicolo v = new Veicolo(
    			numeroRuote, 
    			numeroFari, 
    			cilindrata, 
    			numeroPosti, 
    			numeroSpecchietti, 
    			coloreVeicolo,
    			tipoMotore,
    			velocitaMax,
    			tipoCarburante
    	);
    	Auto a = new Auto(
    			numeroRuote, 
    			numeroFari, 
    			cilindrata, 
    			numeroPosti, 
    			numeroSpecchietti, 
    			coloreVeicolo,
    			tipoMotore,
    			velocitaMax,
    			tipoCarburante,
    			numeroPorte,
    			numeroAirBag,
    			numeroFinestrini
    	);
    	System.out.println("Numero ruote veicolo: " + v.getNumeroRuote());
    	System.out.println("Numero posti veicolo: " + v.getNumeroPosti());
    	System.out.println("Numero fari veicolo: " + v.getNumeroFari());
    	System.out.println("Numero specchietti veicolo: " + v.getNumeroSpecchietti());
    	System.out.println("Cilindrata veicolo: " + v.getCilindrata());
    	System.out.println("Colore veicolo: " + v.getColoreVeicolo());
    	System.out.println("Velocita massima veicolo: " + v.getVelocitaMax());
    	System.out.println("Tipo motore veicolo: " + v.getTipoMotore());
    	System.out.println("Tipo carburante veicolo: " + v.getTipoCarburante());
    	
    	System.out.println("Numero ruote auto: " + v.getNumeroRuote());
    	System.out.println("Numero posti auto: " + v.getNumeroPosti());
    	System.out.println("Numero fari auto: " + v.getNumeroFari());
    	System.out.println("Numero specchietti auto: " + v.getNumeroSpecchietti());
    	System.out.println("Cilindrata auto: " + v.getCilindrata());
    	System.out.println("Colore auto: " + v.getColoreVeicolo());
    	System.out.println("Velocita massima auto: " + v.getVelocitaMax());
    	System.out.println("Tipo motore auto: " + v.getTipoMotore());
    	System.out.println("Tipo carburante auto: " + v.getTipoCarburante());
    	System.out.println("Numero AirBag auto: " + a.getNumeroAirBag());
    	System.out.println("Numero finestrini: " + a.getnumeroFinestrini());
    	System.out.println("Numero porte: " + a.getNumeroPorte());
    }
	
	public static int getIntInput(String messaggio) {
		// Il metodo è dichiarato come static perchè sennò il metodo main non può chiamarlo
		Scanner input = new Scanner(System.in); // istanza alla classe Scanner per input da tastiera.
		int valore = 0;
        System.out.println(messaggio);
		/*
		 * Verifico finchè l'input inserito non è un intero, se non è intero, richiedo un ulteriore input da tastiera, nel momento in cui 
		 * il ciclo finirà significherà che l'utente ha inserito un numero intero, quindi procedo con l'assegnazione.
		 */
        while (!input.hasNextInt()) {
    		System.out.println("Tipo di dato errato!\nInserisci di nuovo: ");
    		input.next();
        }       
        valore = input.nextInt();
        return valore;
	}
	
	public static float getFloatInput(String messaggio) {
		// Il metodo è dichiarato come static perchè sennò il metodo main non può chiamarlo
		Scanner input = new Scanner(System.in); // istanza alla classe Scanner per input da tastiera.
		float valore = 0;
        System.out.println(messaggio);
        while (!input.hasNextFloat()) {
    		System.out.println("Tipo di dato errato!\nInserisci di nuovo: ");
    		input.next();
        }
        valore = input.nextFloat();
        return valore;
	}
	
	public static String getStringInput(String messaggio) {
		// Il metodo è dichiarato come static perchè sennò il metodo main non può chiamarlo
		Scanner input = new Scanner(System.in); // istanza alla classe Scanner per input da tastiera.
        System.out.println(messaggio);
		String valore = input.nextLine();
        return valore;
	}
}