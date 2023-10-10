package it.java.esercizi.classi.ereditarieta;
import java.util.Scanner;


public class Main {
    public static void main(String[] args){
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
}