package it.java.cinema;

public class Prenotazione {
	private int numeroPrenotazione;
	private Film filmPrenotato;
	private int filaPrenotata;
	private int postoPrenotato;
	private float costoTotale;
	public float COSTO_PER_FILM = 8.99f;
	
	public Prenotazione(int numeroPrenotazione, Film filmPrenotato, int filaPrenotata, int postoPrenotato) {
		setNumeroPrenotazione(numeroPrenotazione);
		setFilmPrenotato(filmPrenotato);
		setFilaPrenotata(filaPrenotata);
		setPostoPrenotato(postoPrenotato);
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
}
