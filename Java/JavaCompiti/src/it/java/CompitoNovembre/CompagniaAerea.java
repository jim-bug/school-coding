package it.java.CompitoNovembre;

public class CompagniaAerea {
	private int numeroVoli;
	private int numeroPassegeri;
	private int numeroPassegeriInseriti = 0;
	private int numeroVoliInseriti = 0;
	private Volo[] elencoVoli;
	private Passegero[] elencoPassegeri;
	public CompagniaAerea(int numeroVoli, int numeroPassegeri) {
		setNumeroPassegero(numeroPassegeri);
		setNumeroVoli(numeroVoli);
		elencoVoli = new Volo[numeroVoli];
		elencoPassegeri = new Passegero[numeroPassegeri];
	};
	public int getNumeroVoli() {
		return numeroVoli;
	}
	public void setNumeroVoli(int numeroVoli) {
		this.numeroVoli = numeroVoli;
	}

	public int getNumeroPassegero() {
		return numeroPassegeri;
	}
	public void setNumeroPassegero(int numeroPassegero) {
		this.numeroPassegeri = numeroPassegero;
	}
	public void aggiungiPassegero(Passegero passegero) {
		System.out.println(numeroPassegeriInseriti);
		elencoPassegeri[numeroPassegeriInseriti] = passegero;
		numeroPassegeriInseriti ++;
	}
	public void aggiungiVolo(Volo volo) {
		elencoVoli[numeroVoliInseriti] = volo;
		numeroVoliInseriti ++;
	}
	public void getElencoPassegeri() {
		for(int i = 0;i < numeroPassegeriInseriti;i++) {
			System.out.println("Passegero: " + elencoPassegeri[i].getNome() + " dati voli: ");
			elencoPassegeri[i].getDatiVolo();
		}
	}
	public void getElencoVoli() {
		for(int i = 0;i < numeroVoliInseriti;i++) {
			System.out.println("Volo: " + elencoVoli[i].getDestinazione() + " numero: " + i + " data di partenza prevista: " + elencoVoli[i].getDataDiPartenza().toString());
		}
	}

	
	
}
