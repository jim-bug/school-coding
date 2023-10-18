package it.java.esercizi.classi.ereditarieta;
import java.util.Scanner;
import java.time.LocalDate;


public class Main {
    public static void main(String[] args){
//        int numeroRuote = getIntInput("Inserisci il numero di ruote: ");
//        int numeroFinestrini = getIntInput("Inserisci il numero di finestrini: ");
//        int numeroAirBag = getIntInput("Inserisci il numero di AirBag: ");
//        int numeroPorte = getIntInput("Inserisci il numero di porte: ");
//        int numeroFari = getIntInput("Inserisci il numero di fari: ");
//        int numeroPosti = getIntInput("Inserisci il numero di posti: ");
//        int numeroSpecchietti = getIntInput("Inserisci il numero di specchietti: ");
        int giorno = getIntInput("Inserisci il giorno di immatricolazione: ");
        int mese = getIntInput("Inserisci il mese di immatricolazione: ");
        int anno = getIntInput("Inserisci l'anno d iimmatricolazione: ");
//        float velocitaMax = getFloatInput("Inserisci la massima velocità: ");
//        String cilindrata = getStringInput("Inserisci la cilidrata: ");
//        String coloreVeicolo = getStringInput("Inserisci il colore del veicolo: ");
//        String tipoCarburante = getStringInput("Inserisci il tipo di carburante");
//        String tipoMotore = getStringInput("Inserisci il tipo di motore: ");
//        String targa = getStringInput("Inserisci la targa dell'auto: ");
        LocalDate dataDiImmatricolazione = LocalDate.of(anno, mese, giorno);
        LocalDate dataDiOggi = LocalDate.now();
        while(dataDiOggi.getYear() < dataDiImmatricolazione.getYear()) {
        	anno = getIntInput("Data di immatricolazione non valida, inserisci l'anno di immatricolazione: ")
        	dataDiImmatricolazione = LocalDate.of(anno,  mese,  giorno);
        }
//
//    	Veicolo v = new Veicolo(
//    			numeroRuote, 
//    			numeroFari, 
//    			cilindrata, 
//    			numeroPosti, 
//    			numeroSpecchietti, 
//    			coloreVeicolo,
//    			tipoMotore,
//    			velocitaMax,
//    			tipoCarburante,
//    			dataDiImmatricolazione
//    	);
    	
//        numeroRuote = getIntInput("Inserisci il numero di ruote auto: ");
//        numeroPorte = getIntInput("Inserisci il numero di porte auto: ");
//        numeroFari = getIntInput("Inserisci il numero di fari auto: ");
//        numeroPosti = getIntInput("Inserisci il numero di posti auto: ");
//        numeroSpecchietti = getIntInput("Inserisci il numero di specchietti auto: ");
//        velocitaMax = getFloatInput("Inserisci la massima velocità auto: ");
//        cilindrata = getStringInput("Inserisci la cilidrata auto: ");
//        coloreVeicolo = getStringInput("Inserisci il colore del veicolo auto: ");
//        tipoCarburante = getStringInput("Inserisci il tipo di carburante auto: ");
//        tipoMotore = getStringInput("Inserisci il tipo di motore auto: ");
//        
//    	Auto a = new Auto(
//    			numeroRuote, 
//    			numeroFari, 
//    			cilindrata, 
//    			numeroPosti, 
//    			numeroSpecchietti, 
//    			coloreVeicolo,
//    			tipoMotore,
//    			velocitaMax,
//    			tipoCarburante,
//    			numeroPorte,
//    			numeroAirBag,
//    			numeroFinestrini,
//    			targa
//    	);
//    	
//    	System.out.println("Numero ruote veicolo: " + v.getNumeroRuote());
//    	System.out.println("Numero posti veicolo: " + v.getNumeroPosti());
//    	System.out.println("Numero fari veicolo: " + v.getNumeroFari());
//    	System.out.println("Numero specchietti veicolo: " + v.getNumeroSpecchietti());
//    	System.out.println("Cilindrata veicolo: " + v.getCilindrata());
//    	System.out.println("Colore veicolo: " + v.getColoreVeicolo());
//    	System.out.println("Velocita massima veicolo: " + v.getVelocitaMax());
//    	System.out.println("Tipo motore veicolo: " + v.getTipoMotore());
//    	System.out.println("Tipo carburante veicolo: " + v.getTipoCarburante());
//    	
//    	System.out.println();
//    	
//    	System.out.println("Numero ruote auto: " + a.getNumeroRuote());
//    	System.out.println("Numero posti auto: " + a.getNumeroPosti());
//    	System.out.println("Numero fari auto: " + a.getNumeroFari());
//    	System.out.println("Numero specchietti auto: " + a.getNumeroSpecchietti());
//    	System.out.println("Cilindrata auto: " + a.getCilindrata());
//    	System.out.println("Colore auto: " + a.getColoreVeicolo());
//    	System.out.println("Velocita massima auto: " + a.getVelocitaMax());
//    	System.out.println("Tipo motore auto: " + a.getTipoMotore());
//    	System.out.println("Tipo carburante auto: " + a.getTipoCarburante());
//    	System.out.println("Numero AirBag auto: " + a.getNumeroAirBag());
//    	System.out.println("Numero finestrini: " + a.getnumeroFinestrini());
//    	System.out.println("Numero porte: " + a.getNumeroPorte());
//    	System.out.println("La targa dell'auto è: " + a.getTarga());
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
	public static 
}