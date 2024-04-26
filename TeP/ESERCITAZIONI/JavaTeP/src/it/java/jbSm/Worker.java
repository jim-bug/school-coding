/*
 * Autore: Ignazio Leonardo Calogero Sperandeo.
 * Data: 25/04/2024
 * Consegna: Scrivere in java un programma equivalente a BSM che accetti gli stessi file di input.
 * */

package it.java.jbSm;


import java.io.File;
import java.util.Scanner;
import java.util.concurrent.Semaphore;		// classe per il semaforo


/**
 * Classe che contiene il metodo che ogni thread eseguirà.
 *
 * @author Ignazio Leonardo Calogero Sperandeo
 * @see Runnable
 * */
public class Worker implements Runnable{
	public static double money = 0.0;
	private static Semaphore mutex = new Semaphore(1);
	private String nFile;
	
	/**
	 * Costruttore.
	 * 
	 * @param nFile Rappresenta il numero associato al file che deve aprire e leggere*/
	public Worker(String nFile) {
		setNumeroFile(nFile);
	}
	
	/**
	 * Ogni Thread eseguirà questo metodo.
	 * 
	 * @see Runnable*/
	@Override
	public void run() {
		/*
		String currentPath = System.getProperty("user.dir")+"/cash"+(char)(nFile+48);		// ottengo la posizione attuale sul filesystem
		
		 * Dato che numeroFile è un intero, se lo converto in char non ottengo '1', per ottenere 1, sfruttando la tabella ASCII, sommo all'intero 48(codice ASCII di '0'),
		 * così otterrò l'equivalente ma come carattere.
		 * 
		 * Esempio:
		 * 1+48 -> 49
		 * 49 -> char -> '1'
		 * 
		 * */
		String currentPath = System.getProperty("user.dir")+"/cash"+nFile;		
		try {
			File file = new File(currentPath);
			Scanner stream = new Scanner(file);		// oggetto che legge dallo stream, in questo caso un file.
			
			while(stream.hasNextLine()) {		// finchè le righe del file non son vuote
				String line = stream.nextLine();
				String[] tokenLine = line.split(" ");	// divido la stringa in due parti con divisore lo spazio.
				Double value = Double.valueOf(tokenLine[1]);		// il secondo elemento della riga suddivisa è il numero con la virgola
				mutex.acquire();		// lock
				Worker.money += value;		// sezione critica
				mutex.release();		// unlock
			}
		}
		catch(Exception e) {
			System.out.println("Il file: cash" + nFile + " non esiste!");
		}
		
	}

	public String getNumeroFile() {
		return nFile;
	}

	public void setNumeroFile(String nFile) {
		this.nFile = nFile;
	}
	
	
}
