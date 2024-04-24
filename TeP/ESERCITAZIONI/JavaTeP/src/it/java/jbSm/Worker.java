package it.java.jbSm;

import java.io.FileNotFoundException;
import java.nio.file.Path;
import java.io.File;
import java.util.Scanner;
import java.util.concurrent.Semaphore;		// classe per il semaforo



public class Worker implements Runnable{
	public static double money = 0.0;
	private static Semaphore mutex = new Semaphore(1);
	private int numeroFile;
	
	public Worker(int numeroFile) {
		setNumeroFile(numeroFile);
	}
	

	public void run() {
		String current_path = "/home/jim_bug/school-coding/TeP/ESERCITAZIONI/JavaTeP/src/it/java/jbSm/cash"+(char)(numeroFile+48);		// ottengo la posizione attuale sul filesystem
		/*
		 * Dato che numeroFile è un intero, se lo converto in char non ottengo '1', per ottenere 1, sfruttando la tabella ASCII, sommo all'intero 48(codice ASCII di '0'),
		 * così otterrò l'equivalente ma come carattere.
		 * 
		 * Esempio:
		 * 1+48 -> 49
		 * 49 -> char -> '1'
		 * 
		 * */
		try {
			File file = new File(current_path);
			Scanner stream = new Scanner(file);		// oggetto che legge dallo stream, in questo caso un file.
			
			while(stream.hasNextLine()) {		// finchè le righe del file non son vuote
				String line = stream.nextLine();
				Double value = Double.valueOf(line.substring(11));		// estraggo dalla posizione undicesima fino alla fine della stringa e lo converto in Double.
				mutex.acquire();		// lock
				Worker.money += value;		// sezione critica
				mutex.release();		// unlock
			}
		}
		catch(Exception e) {
			System.out.println("Il file non esiste!");
		}
		
	}

	public int getNumeroFile() {
		return numeroFile;
	}

	public void setNumeroFile(int numeroFile) {
		this.numeroFile = numeroFile;
	}
	
	
}
