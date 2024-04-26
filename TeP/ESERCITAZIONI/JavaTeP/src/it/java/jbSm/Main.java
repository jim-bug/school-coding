/*
 * Autore: Ignazio Leonardo Calogero Sperandeo.
 * Data: 25/04/2024
 * Consegna: Scrivere in java un programma equivalente a BSM che accetti gli stessi file di input.
 * */
package it.java.jbSm;

public class Main {

	public static void main(String[] args) {
		BankSyncModified bsm = new BankSyncModified(args);	// uso i varargs
		System.out.println("Account state: " + bsm.getAccountState());
	}

}
