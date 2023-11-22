package it.java.CompitoNovembre;
import java.time.LocalDate;
public class Volo {
	private int numeroVolo;
	private String destinazione;
	private LocalDate dataDiPartenza;
	private int postiDisponibili;
	public Volo(int numeroVolo, String destinazione, LocalDate dataDiPartenza, int postiDisponibili) {
		this.numeroVolo = numeroVolo;
		this.destinazione = destinazione;
		this.dataDiPartenza = dataDiPartenza;
		this.postiDisponibili = postiDisponibili;
	}
	public Volo() {};
	public Volo(int numeroVolo, String destinazione, LocalDate dataDiPartenza) {
		this.numeroVolo = numeroVolo;
		this.destinazione = destinazione;
		this.dataDiPartenza = dataDiPartenza;
	}
	public int getNumeroVolo() {
		return numeroVolo;
	}
	public void setNumeroVolo(int numeroVolo) {
		this.numeroVolo = numeroVolo;
	}
	public String getDestinazione() {
		return destinazione;
	}
	public void setDestinazione(String destinazione) {
		this.destinazione = destinazione;
	}
	public LocalDate getDataDiPartenza() {
		return dataDiPartenza;
	}
	public void setDataDiPartenza(LocalDate dataDiPartenza) {
		this.dataDiPartenza = dataDiPartenza;
	}
	public int getPostiDisponibili() {
		return postiDisponibili;
	}
	public void setPostiDisponibili(int postiDisponibili) {
		this.postiDisponibili = postiDisponibili;
	}
	
	
	
}
