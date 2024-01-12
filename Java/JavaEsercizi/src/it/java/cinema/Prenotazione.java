package it.java.cinema;

import java.util.Scanner;

public class Prenotazione {
	private int numeroPrenotazione;
	private Film filmPrenotato;
	private int filaPrenotata;
	private int postoPrenotato;
	private Sala numeroSala;
	private float costoTotale;
	public float COSTO_PER_FILM = 8.99f;
	
	public Prenotazione(Film filmPrenotato, Sala numeroSala) {
		setNumeroPrenotazione(getInputInt("Inserisci il numero della prenotazione: "));
		setFilmPrenotato(filmPrenotato);
		setNumeroSala(numeroSala);
		setFilaPrenotata(getInputInt("Inserisci la fila prenotata: "));
		setPostoPrenotato(getInputInt("Inserisci il posto prenotato: "));
	}
	
	public Sala getNumeroSala() {
		return numeroSala;
	}

	public void setNumeroSala(Sala numeroSala) {
		this.numeroSala = numeroSala;
	}

	public void setNumeroPrenotazione(int numeroPrenotazione) {
		this.numeroPrenotazione = numeroPrenotazione;
	}

//	public Film getFilmPrenotato() {
//		return filmPrenotato;
//	}

	public void setFilmPrenotato(Film filmPrenotato) {
		this.filmPrenotato = filmPrenotato;
	}

	public int getFilaPrenotata() {
		return filaPrenotata;
	}

	public void setFilaPrenotata(int filaPrenotata) {
		this.filaPrenotata = filaPrenotata;
	}

	public int getPostoPrenotato() {
		return postoPrenotato;
	}

	public void setPostoPrenotato(int postoPrenotato) {
		this.postoPrenotato = postoPrenotato;
	}

	public float getCostoTotale() {
		return costoTotale;
	}

	public void setCostoTotale(float costoTotale) {
		this.costoTotale = costoTotale;
	}

	public int getNumeroPrenotazione() {
		return numeroPrenotazione;
	}
	
	public void calcolaPosto() {
		setCostoTotale(filmPrenotato.getCosto());
	}
	
	public void visualizzaPrenotazione() {
		System.out.println("Prenotazione: " + getNumeroPrenotazione() + " Fila: " + getFilaPrenotata() + " Posto: " + getPostoPrenotato());
		filmPrenotato.visualizzaFilm();
		System.out.println("Costo: " + getCostoTotale());
	}
	
	public String getInputString(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
	public int getInputInt(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		while(!input.hasNextInt()) {
			System.out.println("Tipo di dato errato!!!\nInserisci di nuovo: ");
			input.next();
		}
		return input.nextInt();
	}
}
