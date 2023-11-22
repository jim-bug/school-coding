package it.java.CompitoNovembre;
import java.time.LocalDate;
public class Passegero {
	private int numeroVoliPrenotatiMax = 20;
	private int numeroVoliPrenotati = 0;
	private Volo[] voliPrenotati = new Volo[numeroVoliPrenotatiMax];
	private String nome;
	private String cognome;
	private int numeroPassegero;
	public Passegero(String nome, String cognome, int numeroPassegero) {
		this.nome = nome;
		this.cognome = cognome;
		this.numeroPassegero = numeroPassegero;
	}
	public String getNome() {
		return nome;
	}
	public void getDatiVolo() {
		for(int i = 0; i < numeroVoliPrenotati; i++) {
			System.out.println("\tVolo " + (int)i+1 + " di "+ this.nome + voliPrenotati[i].getDestinazione() + " in partenza: " + voliPrenotati[i].getDataDiPartenza().toString());
		}
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public int getNumeroPassegero() {
		return numeroPassegero;
	}
	public void setNumeroPassegero(int numeroPassegero) {
		this.numeroPassegero = numeroPassegero;
	}
	public void prenotaVolo(int numeroVolo, Volo volo) {
		voliPrenotati[numeroVoliPrenotati] = volo;
		numeroVoliPrenotati ++; // siccome deve prenotare un singolo volo, mi salvo il numero di volte in cui ha prenotato un volo.	
	}

	
	
}
