package it.java.EsercizioParcheggioConListe;
import java.time.LocalTime;

public class Posto {
	private boolean occupato = false;
	private int x;
	private int y;
	private String targa = "XXXX";
	private LocalTime oraInizio = null;
	
	public Posto(int x, int y) {
		setX(x);
		setY(y);
	}

	/**
	 * @return occupato
	 */
	public boolean isOccupato() {
		return occupato;
	}

	public void setOccupato(boolean occupato) {
		this.occupato = occupato;
	}
	/**
	 * @return x
	 */
	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}
	/**
	 * @return y
	 */
	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}
	/**
	 * @return targa
	 */
	public String getTarga() {
		return targa;
	}

	public void setTarga(String targa) {
		this.targa = targa;
	}
	/**
	 * @return oraInizio
	 */
	public LocalTime getOraInizio() {
		return oraInizio;
	}

	public void setOraInizio(LocalTime oraInizio) {
		this.oraInizio = oraInizio;
	}
	
	public void posteggio(Auto a) {
		this.occupato = true;
		oraInizio = LocalTime.now();
		this.targa = a.getTarga();
	}
	public void liberaPosto() {
		this.occupato = false;
		this.targa = "VEICOLO USCITO";
		oraInizio = null;
	}
	
}
