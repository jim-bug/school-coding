package it.java.cinema;
import java.util.Random;

public class Sala {
	private int numeroSale;
	private int postiDisponibili;
	private int postiPerFila;
	private int file;
	private int[][] mappaPosti;
	
	public Sala(int postiPerFila, int file, int numeroSale) {
		setPostiPerFila(postiPerFila);
		setFile(file);
		setPostiDisponibili(file*postiPerFila);
		setNumeroSale(numeroSale);
		mappaPosti = new int[file][postiPerFila];
		for(int i = 0;i < file;i++) {
			for(int j = 0;j < postiPerFila;j++) {
				mappaPosti[i][j] = '/';
			}
		}
	}

	public int getNumeroSale() {
		return numeroSale;
	}

	public void setNumeroSale(int numeroSale) {
		this.numeroSale = numeroSale;
	}

	public int getPostiDisponibili() {
		return postiDisponibili;
	}

	public void setPostiDisponibili(int postiDisponibili) {
		this.postiDisponibili = postiDisponibili;
	}

	public int getPostiPerFila() {
		return postiPerFila;
	}

	public void setPostiPerFila(int postiPerFila) {
		this.postiPerFila = postiPerFila;
	}

	public int getFile() {
		return file;
	}

	public void setFile(int file) {
		this.file = file;
	}

	public int[][] getMappaPosti() {
		return mappaPosti;
	}

	public void setMappaPosti(int[][] mappaPosti) {
		this.mappaPosti = mappaPosti;
	}
	
	public void prenotaPosto() {
		Random rand = new Random();
		int riga = rand.nextInt(this.file);
		int colonna = rand.nextInt(this.postiPerFila);
		int i = 0;
		while(this.mappaPosti[riga][colonna] == 'X' && i < (file*postiPerFila)) {
			riga = rand.nextInt(this.file);
			colonna = rand.nextInt(this.postiPerFila);
			i ++;
		}
		this.mappaPosti[riga][colonna] = 'X';
	}
	
	public void visualizzaSala() {
		controlloDisponibilita();
		System.out.println("Sala numero: " + getNumeroSale() + "Posti disponibili: " + getPostiDisponibili());
	}
	
	public void visualizzaPosti() {
		for(int i = 0;i < file; i++) {
			for (int j = 0;j < postiPerFila;j++) {
				if(mappaPosti[i][j] != 'X') {
					System.out.println("Posto alla fila " + (int)(i+1) + " e alla posizione " + (int)(i+1) + "Stato: LIBERO");
				}
				else {
					System.out.println("Posto alla fila " + (int)(i+1) + " e alla posizione " + (int)(i+1) + "Stato: OCCUPATO");
				}
			}
		}
	}
	
	private void controlloDisponibilita() {
		for(int i = 0; i < file; i++) {
			for (int j = 0; j < postiPerFila;j++) {
				if(this.mappaPosti[i][j] == 'X') {
					this.postiDisponibili --;
				}
			}
		}
	}
	
}
