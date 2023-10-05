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
        String tipoColore = "";
        int velocitaMax = 0;
        String tipoCarburante = "";
        System.out.println("Inserisci il numero di ruote: ");
        do {
        	if (input.hasNextInt())
        		numeroRuote = input.nextInt();
        	else
        		input.next();
        }
        while (!input.hasNextInt());
        do {
        	if (input.hasNextInt())
        		numeroFari = input.nextInt();
        	else
        		input.next();
        }
        while (!input.hasNextInt());
        do {
        	if (input.hasNextInt())
        		numeroSpecchietti = input.nextInt();
        	else
        		input.next();
        }
        while (!input.hasNextInt());
        do {
        	if (input.hasNextInt())
        		velocitaMax = input.nextInt();
        	else
        		input.next();
        }
        while (!input.hasNextInt());
       
    	Veicolo v = new Veicolo(
    			numeroRuote, 
    			numeroFari, 
    			cilindrata, 
    			numeroPosti, 
    			numeroSpecchietti, 
    			coloreVeicolo, 
    			tipoCarburante, 
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
    	System.out.println("Tipo motore veicolo: " + v.getTipoCarburante());
    	// 
    	
    	// int numero = input.nextInt(); // esempio di input da tastiera di un numero intero che sarà assegnato alla variabile numero.
    	// System.out.print(numero);
    	// .nextLine() per stringhe in input
    	// .nextDouble();
    	// .hasNextInt() ritorna True se l'input è un intero.
//    	
//    	System.out.println(input.hasNextInt()); // controllo se l'ultimo input è un intero.
//    	int numero = input.nextInt();  // dato che è uno stream la variabile numero avrà il valore che abbiamo verificato se era int in precedenza.
//    	System.out.println(numero);
    	

    }
}