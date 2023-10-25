package it.java.EsercizioParcheggio;
/*
 * Classe parcheggio: .
 * Classe auto semplificata: 3 attributi di istanza: marca, modello, targa.
 * Classe posto: attributi di istanza(occupato, x, y, targaAuto, oraInizio)
 * Classe posto metodo parcheggio(Auto), liberaPosto
 * */
public class Parcheggio {
	// private int numeroPosti = 10;
	private Posto[] posti = new Posto[10];
	private float totaleGiornaliero;
	
	public Parcheggio() {
		for(int i = 0;i < 10;i++) {
			posti[i] = new Posto(1, i);
		}
	}
	
	public float getTotaleGiornaliero() {
		return totaleGiornaliero;
	}
	public void setTotaleGiornaliero(float totaleGiornaliero) {
		this.totaleGiornaliero = totaleGiornaliero;
	}
	
	public void assegnaPosto(Auto a) {
		int postoLibero = 0;
		for (int i = 0;i < 10; i++) {
			if(!posti[i].isOccupato()) {
				postoLibero = i;
			}
		}
		posti[postoLibero].posteggio(a);
	}
	
	public boolean controlloDisponibilita() {
		for (int i = 0;i < 10; i++) {
			if(!posti[i].isOccupato()) {
				return true;
			}
		}
		return false;
	}
	
	public void liberaPosto(Auto a) {
		for(int i = 0;i < 10; i++) {
			if(a.getTarga().equals(posti[i].getTarga())) {
				posti[i].setOccupato(false);
			}
		}
	}
	
}
