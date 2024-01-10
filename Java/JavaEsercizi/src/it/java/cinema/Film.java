package it.java.cinema;

public class Film {
	private String titolo;
	private String genere;
	private float durata;
	private int sala;
	private float costo;
	
	public Film(String titolo, String genere, float durata, int sala, float costo) {
		setTitolo(titolo);
		setGenere(genere);
		setDurata(durata);
		setSala(sala);
		setCosto(costo);
	}

	public float getCosto() {
		return costo;
	}

	public void setCosto(float costo) {
		this.costo = costo;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getGenere() {
		return genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public float getDurata() {
		return durata;
	}

	public void setDurata(float durata) {
		this.durata = durata;
	}

	public int getSala() {
		return sala;
	}

	public void setSala(int sala) {
		this.sala = sala;
	}
	
	public void visualizzaFilm() {
		System.out.println("Film: " + getTitolo() + "Genere: " + getGenere() + "Durata: " + getDurata() + "Programmato per la sala: " + getSala());
	}
}
