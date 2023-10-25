package it.java.EsercizioParcheggio;
import java.time.LocalDateTime;

public class Posto {
	private boolean occupato = false;
	private int x;
	private int y;
	private String targa;
	private LocalDateTime oraInizio;
	
	public Posto(int x, int y) {
		setX(x);
		setY(y);
	}

	public boolean isOccupato() {
		return occupato;
	}

	public void setOccupato(boolean occupato) {
		this.occupato = occupato;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public String getTarga() {
		return targa;
	}

	public void setTarga(String targa) {
		this.targa = targa;
	}

	public LocalDateTime getOraInizio() {
		return oraInizio;
	}

	public void setOraInizio(LocalDateTime oraInizio) {
		this.oraInizio = oraInizio;
	}
	
	public void posteggio(Auto a) {
		this.occupato = true;
		oraInizio = LocalDateTime.now();
		this.targa = a.getTarga();
	}
	public void liberaPosto() {
		this.occupato = false;
		this.targa = "X";
	}
	
}
