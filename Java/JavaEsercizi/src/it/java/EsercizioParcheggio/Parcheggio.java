package it.java.EsercizioParcheggio;
import java.time.LocalTime;

/**
 * Classe parcheggio
 * @author Ignazio Leonardo Calogero Sperandeo
 * */

public class Parcheggio {
	static final float TARIFFA_ORARIA = 5;
	private int numeroDiPosti;
	private Posto[] posti;
	private float totaleGiornaliero;
	/**
	 * Crea un parcheggio con this.numeroDiPosti posti, dove le coordinate dei posti sono tutte sull'asse delle y, variando solo la x.
	 * Nessun parametro richiesto
	 */
	public Parcheggio(int numeroDiPosti) {
		this.numeroDiPosti = numeroDiPosti;
		posti = new Posto[this.numeroDiPosti];
		for(int i = 0;i < this.numeroDiPosti;i++) {
			posti[i] = new Posto(i, 1);
		}
	}
	/**
	 * Ritorna il totale giornaliero del parcheggio
	 * @return totaleGiornaliero
	 * */
	public float getTotaleGiornaliero() {
		return totaleGiornaliero;
	}
	
//	public void setTotaleGiornaliero(float totaleGiornaliero) {
//		this.totaleGiornaliero = totaleGiornaliero;
//	}
	/**
	 * Questo metodo si occupa di trovare un posto libero tra l'array di posti non appena ne trova uno libero lo assegna all'auto.
	 * @param a Oggetto di tipi Auto.
	 * */
	public void assegnaPosto(Auto a) {
		int postoLibero = 0;
		for (int i = 0;i < this.numeroDiPosti; i++) {
			if(!posti[i].isOccupato()) {
				postoLibero = i;
				posti[postoLibero].posteggio(a);
				break;
			}
			System.out.println("Posti esauriti!");
		}
		
	}
	/**
	 * Questo metodo di occupa di verificare se c'è almeno un posto libero nel parcheggio.
	 * @return true se almeno un posto è libero
	 * @return false se tutti i posti sono occupati
	 * */
	public boolean controlloDisponibilita() {
		for (int i = 0;i < this.numeroDiPosti; i++) {
			if(!posti[i].isOccupato()) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Questo metodo si occupa di liberare il posto associato ad una determinata Auto.
	 * @param a Oggetto di tipo Auto
	 * */
	public void liberaPosto(Auto a) {
		for(int i = 0;i < this.numeroDiPosti; i++) {
			if(a.getTarga().equals(posti[i].getTarga())) {
				posti[i].liberaPosto();
			}
		}
	}
	/**
	 * Questo metodo si occupa di calcolare il prezzo totale del parcheggio.
	 * @param a Oggetto di tipo Auto
	 * @param fineParcheggio Oggetto di tipo LocalTime, esprime l'ora di terminazione del parcheggio
	 * @return prezzo
	 * */
	public float calcolaPrezzo(Auto a, LocalTime fineParcheggio) {
		float oraFinale = formattaOra(fineParcheggio);
		float oraIniziale = formattaOra(posti[trovaPostoAssociatoAuto(a)].getOraInizio());
		System.out.println("Auto: " + a.getModello() + "\n" + "Ora di inizio parcheggio : " + posti[trovaPostoAssociatoAuto(a)].getOraInizio() + "\n" +"Ora di fine parcheggio: " + fineParcheggio + "\n");
		
		float tariffaFinale = (oraFinale - oraIniziale)*TARIFFA_ORARIA;
		
		this.totaleGiornaliero = tariffaFinale;
		return tariffaFinale;
		
	}
	/**
	 * Questo metodo si occupa di pagare il parcheggio, con previsto un controllo sull'importo. Inserire l'importo esatto!
	 * @param importo Somma di denaro che diamo per pagare il parcheggio.
	 * @param a Oggetto di tipo Auto.
	 * */
	public void pagaParcheggio(float importo, Auto a) {
		if(importo < this.totaleGiornaliero) {
			System.out.println("Importo troppo basso!\nIl parcheggio non è stato saldato");
		}
		else {
			posti[trovaPostoAssociatoAuto(a)].liberaPosto();
		}
	}
	/**
	 * Metodo che restituisce un riepilogo dell'istanza creata.
	 * @return String
	 * */
	public String toString() {
		String mappaturaParcheggio = "";
		for(int i = 0;i < this.numeroDiPosti;i++) {
			mappaturaParcheggio += '\n';
			mappaturaParcheggio += posti[i].getTarga();
			mappaturaParcheggio += '\n';
			mappaturaParcheggio += posti[i].getX() + " " + posti[i].getY();
			mappaturaParcheggio += '\n';
		}
		return mappaturaParcheggio;
	}

	private float formattaOra(LocalTime orario) {
		float minuti = orario.getMinute();
		float secondi = orario.getSecond();
		float ora = (float) (minuti/60) + (secondi/3600) + orario.getHour();
		// System.out.println("Risultato metodo .formattaOra(): " + ora);
		return ora;
	}
	
	private int trovaPostoAssociatoAuto(Auto a) {
		for(int i = 0;i < this.numeroDiPosti; i++) {
			if(a.getTarga().equals(posti[i].getTarga())) {
				return i;
			}
		}
		return 0;
	}

	
}
