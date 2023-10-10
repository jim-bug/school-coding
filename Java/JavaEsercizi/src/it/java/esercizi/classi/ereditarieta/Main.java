package it.java.esercizi.classi.ereditarieta;
import java.util.Scanner;


public class Main {

	
    public static void main(String[] args){
<<<<<<< HEAD
    	Scanner input = new Scanner(System.in); // istanza alla classe Scanner per input da tastiera.
        int numeroRuote = 0;
        int numeroFari = 0;
        String cilindrata = "";
        int numeroPosti = 0;
        int numeroSpecchietti = 0;
        String coloreVeicolo = "";
        float velocitaMax = 0;
        String tipoCarburante = "";
        String tipoMotore = "";
        boolean verificaTipoDiDato = false;
        System.out.println("Inserisci il numero di ruote: ");
        do {
        	if (input.hasNextInt()) {
        		numeroRuote = input.nextInt();
        		verificaTipoDiDato = false;
        		break;
        	}
        		
        	else {
        		System.out.println("Tipo di dato per il numero di ruote errato!\nInserisci un nuovo numero di ruote: ");
        		verificaTipoDiDato = true;
        		input.next();
        	}
        }
        while (!input.hasNextInt());
        if (verificaTipoDiDato) {
        	numeroRuote = input.nextInt();
        } 
        System.out.println("Inserisci il numero di fari: ");
        do {
        	if (input.hasNextInt()) {
        		numeroFari = input.nextInt();
        		verificaTipoDiDato = false;
        		break;
        	}
        	else {
        		System.out.println("Tipo di dato per il numero di fari errato!\nInserisci un nuovo numero di fari: ");
        		verificaTipoDiDato = true;
        		input.next();
        	}
        }
        while (!input.hasNextInt());
        if (verificaTipoDiDato) {
        	numeroFari = input.nextInt();
        } 
        System.out.println("Inserisci il numero di specchietti: ");
        do {
        	if (input.hasNextInt()) {
        		numeroSpecchietti = input.nextInt();
        		verificaTipoDiDato = false;
        		break;
        	}
        	else {
        		System.out.println("Tipo di dato per il numero di specchietti errato!\nInserisci un nuovo numero di specchietti: ");
        		verificaTipoDiDato = true;
        		input.next();
        	}
        		
        }
        while (!input.hasNextInt());
        if (verificaTipoDiDato) {
        	numeroSpecchietti = input.nextInt();
        } 
        System.out.println("Inserisci il numero della velocità massima: ");
        do {
            	if (input.hasNextFloat()) {
            		velocitaMax = input.nextFloat();
            		verificaTipoDiDato = false;
            		break;
            	}
        	else {
        		System.out.println("Tipo di dato per il numero massimo della velocità errato!\nInserisci un nuovo numero massimo della velocità: ");
        		verificaTipoDiDato = true;
        		input.next();
        	}
        }
        while (!input.hasNextFloat());
        if (verificaTipoDiDato) {
        	velocitaMax = input.nextFloat();
        } 
        System.out.println("Inserisci il numero di posti: ");
        do {
        	if (input.hasNextInt()) {
        		numeroPosti = input.nextInt();
        		verificaTipoDiDato = false;
        		break;
        	}
        	else {
        		System.out.println("Tipo di dato per il numero di posti errato!\nInserisci un nuovo numero di posti: ");
        		verificaTipoDiDato = true;
        		input.next();
        	}
        }
        while(!input.hasNextInt());
        if (verificaTipoDiDato) {
        	numeroPosti = input.nextInt();
        } 
		System.out.println("Inserisci la cilindrata del veicolo: ");
		input.nextLine();
        cilindrata = input.nextLine();
        System.out.println("Inserisci il tipo di motore del veicolo: ");
        tipoMotore = input.nextLine();
        System.out.println("Inserisci il tipo del carburante del veicolo: ");
        tipoCarburante = input.nextLine();
        System.out.println("Inserisci il colore del veicolo: ");
        coloreVeicolo = input.nextLine();
=======
    	
        int numeroRuote = getIntInput("Inserisci il numero di ruote: ");
        int numeroFari = getIntInput("Inserisci il numero di fari: ");
        int numeroPosti = getIntInput("Inserisci il numero di posti: ");
        int numeroSpecchietti = getIntInput("Inserisci il numero di specchietti: ");
        float velocitaMax = getFloatInput("Inserisci la massima velocità: ");
        String cilindrata = getStringInput("Inserisci la cilidrata: ");
        String coloreVeicolo = getStringInput("Inserisci il colore del veicolo: ");
        String tipoCarburante = getStringInput("Inserisci il tipo di carburante");
        String tipoMotore = getStringInput("Inserisci il tipo di motore: ");
>>>>>>> 345f169e2cf99d371f71537f4c76d7dc173573da
        
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
    	System.out.println("Numero ruote veicolo: " + v.getNumeroRuote());
    	System.out.println("Numero posti veicolo: " + v.getNumeroPosti());
    	System.out.println("Numero fari veicolo: " + v.getNumeroFari());
    	System.out.println("Numero specchietti veicolo: " + v.getNumeroSpecchietti());
    	System.out.println("Cilindrata veicolo: " + v.getCilindrata());
    	System.out.println("Colore veicolo: " + v.getColoreVeicolo());
    	System.out.println("Velocita massima veicolo: " + v.getVelocitaMax());
    	System.out.println("Tipo motore veicolo: " + v.getTipoMotore());
    	System.out.println("Tipo carburante veicolo: " + v.getTipoCarburante());
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