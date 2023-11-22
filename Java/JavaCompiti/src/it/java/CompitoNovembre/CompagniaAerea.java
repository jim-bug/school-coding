package it.java.CompitoNovembre;

public class CompagniaAerea {
	private int numeroVoli;
	private int numeroPassegero;
	private int numeroPassegeriInseriti;
	private int numeroVoliInseriti;
	private Volo[] elencoVoli = new Volo[numeroVoli];
	private Passegero[] elencoPassegeri = new Passegero[numeroPassegero];
	public CompagniaAerea(int numeroVoli, int numeroPassegero) {
		this.numeroVoli = numeroVoli;
		this.elencoVoli = elencoVoli;
	}
	public CompagniaAerea() {};
	public int getNumeroVoli() {
		return numeroVoli;
	}
	public void setNumeroVoli(int numeroVoli) {
		this.numeroVoli = numeroVoli;
	}
	public int getNumeroPassegero() {
		return numeroPassegero;
	}
	public void setNumeroPassegero(int numeroPassegero) {
		this.numeroPassegero = numeroPassegero;
	}
	public void aggiungiPassegero(Passegero passegero) {
		elencoPassegeri[numeroPassegeriInseriti] = passegero;
		numeroPassegeriInseriti ++;
	}
	public void aggiungiVolo(Volo volo) {
		elencoVoli[numeroVoliInseriti] = volo;
		numeroVoliInseriti ++;
	}
	public void getElencoPassegeri() {
		for(int i = 0;i < numeroPassegeriInseriti;i++) {
			System.out.println("Passegero: " + elencoPassegeri[i].getNome());
		}
	}
	public void getElencoVoli() {
		for(int i = 0;i < numeroVoliInseriti;i++) {
			System.out.println("Passegero: " + elencoVoli[i].getDestinazione());
		}
	}

	
	
}
