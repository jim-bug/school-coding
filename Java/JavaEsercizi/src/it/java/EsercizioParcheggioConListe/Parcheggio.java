package it.java.EsercizioParcheggioConListe;
import java.time.LocalTime;
import java.lang.Math;

/**
 * Classe parcheggio
 * @author Ignazio Leonardo Calogero Sperandeo
 * */

public class Parcheggio {
	static final float TARIFFA_ORARIA = 5;
	private int numeroDiPosti = 3;
	private Lista posti = new Lista();
	private float totaleGiornaliero = 0;
	/**
	 * Crea un parcheggio con this.numeroDiPosti posti, dove le coordinate dei posti sono tutte sull'asse delle y, variando solo la x.
	 * Nessun parametro richiesto
	 */
	public Parcheggio() {
		for(int i = 0;i < this.numeroDiPosti;i++) {
			Posto posto = new Posto(i, 1);
			posti.inserisci(posto);
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
			if(!posti.stampa(i).isOccupato()) {
				postoLibero = i;
				posti.stampa(postoLibero).posteggio(a);
				break;
			}
		}
		
	}
	/**
	 * Questo metodo di occupa di verificare se c'è almeno un posto libero nel parcheggio.
	 * @return true se almeno un posto è libero
	 * @return false se tutti i posti sono occupati
	 * */
	public boolean controlloDisponibilita() {
		for (int i = 0;i < this.numeroDiPosti; i++) {
			if(!posti.stampa(i).isOccupato()) {
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
			if(a.getTarga().equals(posti.stampa(i).getTarga())) {
				posti.stampa(i).liberaPosto();
				break;
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
		float oraIniziale = formattaOra(posti.stampa(trovaPostoAssociatoAuto(a)).getOraInizio());
		
		
		float tariffaFinale = (Math.abs(oraFinale - oraIniziale))*TARIFFA_ORARIA;
		

		return tariffaFinale;
		
	}
	/**
	 * Questo metodo si occupa di pagare il parcheggio, con previsto un controllo sull'importo. Inserire l'importo esatto!
	 * @param importo Somma di denaro che diamo per pagare il parcheggio.
	 * @param a Oggetto di tipo Auto.
	 * */
	public void pagaParcheggio(float importo, Auto a, LocalTime fineParcheggio) {
		if(importo < calcolaPrezzo(a, fineParcheggio)) {
			System.out.println("Importo troppo basso!\nIl parcheggio non è stato saldato");
		}
		else {
			if(importo == calcolaPrezzo(a, fineParcheggio)) {
				this.totaleGiornaliero += importo;
			}
			else {
				this.totaleGiornaliero += importo;
				System.out.println("Resto: " + (importo - calcolaPrezzo(a, fineParcheggio)));
				liberaPosto(a);
			}
			
		}
	}
	/**
	 * Metodo che restituisce un riepilogo dell'istanza creata.
	 * @return String
	 * */
	public String toString() {
		String mappaturaParcheggio = "";
		for(int i = 0;i < this.numeroDiPosti;i++) {
				mappaturaParcheggio += "Targa Auto: " + posti.stampa(i).getTarga() + " ";
				mappaturaParcheggio += "Coordinate Posteggio: " + posti.stampa(i).getX() + " " + posti.stampa(i).getY();
				mappaturaParcheggio += "Orario ingresso: " + posti.stampa(i).getOraInizio();
				mappaturaParcheggio += '\n';
		}
		return mappaturaParcheggio;
	}
	
	public String toString(Auto a, LocalTime fineParcheggio) {
		return "Auto: " + a.getModello() + "\n" + "Ora di inizio parcheggio : " + posti.stampa(trovaPostoAssociatoAuto(a)).getOraInizio() + "\n" +"Ora di fine parcheggio: " + fineParcheggio + "\n" + "Importo da pagare: " + calcolaPrezzo(a, fineParcheggio);
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
			if(a.getTarga().equals(posti.stampa(i).getTarga())) {
				return i;
			}
		}
		return 0;
	}

	
}
