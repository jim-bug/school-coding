package it.java.jbSm;

import java.text.DecimalFormat;

public class BankSyncModified{
	public static int a = 5;
	private Integer nThread = 0;
	private Thread[] threads;
	
	public BankSyncModified(String nThread) {
		setNThread(nThread);
		threads = new Thread[this.nThread];
		createThread();
		System.out.println(this.getAccountState());
		Worker.money = 0.0;
	}
	
	public double getAccountState() {
		DecimalFormat df = new DecimalFormat("#.##");	// arrotondo a due cifre decimali
		return Double.parseDouble(df.format(Worker.money));
	}
	
	public void setNThread(String nThread) {
		try {
			this.nThread = Integer.parseInt(nThread);
			if(this.nThread <= 0) {
				throw new Exception();
			}
		}
		catch(Exception e) {
			System.out.println("TIPO DI INPUT NON SUPPORTATO, INSERISCI UN NUMERO STRETTAMENTE MAGGIORE DI 0");
		}
	}
	
	public int getNThread() {
		return this.nThread;
	}
	
	private void createThread() {
		for(int i = 0;i < nThread; i++) {
			Worker work = new Worker(i);	// ad ogni thread associo un istanza di worker con un file diverso.
			threads[i] = new Thread(work);	// associo al thread i-esimo l'istanza di worker.
			threads[i].start();
		}
		for(int i = 0;i < nThread; i++) {
			try {		// devo gestire l'eccezione perchè .join() prevede che il metodo chiamante la gestisca.
				threads[i].join();
			}
			catch(Exception e) {
				System.out.println("Errore con il join dei thread.");
			}

		}
		
	}
}
