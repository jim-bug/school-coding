/*
 * Autore: Ignazio Leonardo Calogero Sperandeo.
 * Data: 25/04/2024
 * Consegna: Scrivere in java un programma equivalente a BSM che accetti gli stessi file di input.
 * */

package it.java.jbSm;

import java.text.DecimalFormat;
/**
 * Classe che crea n Thread e gli associa lo stesso Oggetto Runnable.
 * 
 * @author Ignazio Leonardo Calogero Sperandeo
 * @see Runnable
 * @see Thread
 * */
public class BankSyncModified{
	private Integer nThread = 0;
	private Thread[] threads;
	
	/**
	 * Costruttore.
	 * 
	 * @param nThread Il numero di thread da creare.
	 * */
	public BankSyncModified(String arg[]) {
		setNThread(arg);
		threads = new Thread[this.nThread];
		createThreads();
	}
	public BankSyncModified() {}
	/**
	 * Metodo che ritorna la somma totale dei file, ossia il saldo totale.
	 * 
	 * @return La somma totale dei file
	 * @see DecimalFormat
	 * @see Double#parseDouble(double)
	 * 
	 * */
	public double getAccountState() {
		DecimalFormat df = new DecimalFormat("#.##");	// arrotondo a due cifre decimali
		return Double.parseDouble(df.format(Worker.money));
	}
	
	
	/**
	 * Metodo che inizializza il numero di thread, i valori accettati sono solo Stringhe che rappresentano numeri strettamente maggiori di 0
	 * 
	 * @param nThread Numero di thread
	 * @see Exception
	 * */
	public void setNThread(String[] arg) {
		try {
			if(arg.length == 0 || Integer.parseInt(arg[0]) <= 0) {
				throw new Exception();
			}
			this.nThread = Integer.parseInt(arg[0]);

		}
		catch(Exception e) {
			System.out.println("Errore : " + e.getMessage() + 
					"\nPossibili soluzioni:"+"\n"+
					"1) Fornisci un numero di thread strattamente maggiore di 0.\n"+
					"2) Fornisci almeno un argomento.\n"
			);
		}
	}
	
	/**
	 * Questo metodo ritorna il numero di thread.
	 * */
	public int getNThread() {
		return this.nThread;
	}
	
	private void createThreads() {
		Worker.money = 0.0;
		for(Integer i = 0;i < nThread; i++) {
//			System.out.println("Pre-Money: " + Worker.money);
			Worker work = new Worker(i.toString());		// ad ogni thread associo un istanza di worker con un file diverso.
			threads[i] = new Thread(work);		// associo al thread i-esimo l'istanza di worker.
			threads[i].start();
			try {			// devo gestire l'eccezione perchè .join() prevede che il metodo chiamante la gestisca.
				threads[i].join();
			}
			catch(Exception e) {
				System.out.println("Errore con il join dei thread.");
			}
		}
	}
}
