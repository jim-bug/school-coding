package it.java.EsercizioParcheggio;
import java.time.LocalTime;

public class Parcheggio {
	static final float TARIFFA_ORARIA = 5;
	private Posto[] posti = new Posto[10];
	private float totaleGiornaliero;
	
	public Parcheggio() {
		for(int i = 0;i < 10;i++) {
			posti[i] = new Posto(i, 1);
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
				break;
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
				posti[i].liberaPosto();
			}
		}
	}
	
	public float calcolaPrezzo(Auto a) {
		LocalTime fineParcheggio = LocalTime.now();
		float oraFinale = formattaOra(fineParcheggio);
		float oraIniziale = formattaOra(posti[trovaPostoAssociatoAuto(a)].getOraInizio());
		
		float tariffaFinale = (oraIniziale - oraFinale)*TARIFFA_ORARIA;
		
		this.totaleGiornaliero = tariffaFinale;
		return tariffaFinale;
		
	}
	
	public void pagaParcheggio(float importo, Auto a) {
		if(importo < calcolaPrezzo(a)) {
			System.out.println("Importo troppo basso!\nIl parcheggio non è stato saldato");
		}
		else {
			posti[trovaPostoAssociatoAuto(a)].liberaPosto();
		}
	}
	public String toString() {
		String mappaturaParcheggio = "";
		for(int i = 0;i < 10;i++) {
			mappaturaParcheggio += posti[i].getTarga();
			mappaturaParcheggio += '\n';
			mappaturaParcheggio += posti[i].getX() + " " + posti[i].getY();
			mappaturaParcheggio += '\n';
		}
		return mappaturaParcheggio;
	}
	private float formattaOra(LocalTime orario) {
		int minuti = orario.getMinute();
		int secondi = orario.getSecond();
		float ora = (minuti/60) + (secondi/3600);
		
		return ora;
	}
	private int trovaPostoAssociatoAuto(Auto a) {
		for(int i = 0;i < 10; i++) {
			if(a.getTarga().equals(posti[i].getTarga())) {
				return i;
			}
		}
		return 0;
	}

	
}
