package it.java.cinema;
import java.util.Scanner;
public class GestionePrenotazioni {
	private int numeroFilm;
	private int numeroSale;
	private int numeroPrenotazioni;
	private int indexFilm;
	private int indexSale;
	private int indexPrenotazioni;
	private Film[] filmProgrammati;
	private Sala[] elencoSale;
	private Prenotazione[] elencoPrenotazioni;
	
	public GestionePrenotazioni() {
		setNumeroFilm(getIntInput("Inserisci il numero di film: "));
		setNumeroSale(getIntInput("Inserisci il numero di sale: "));
		setNumeroPrenotazioni(getIntInput("Inserisci il numero di prenotazioni: "));
		filmProgrammati = new Film[numeroFilm];
		elencoSale = new Sala[numeroSale];
		elencoPrenotazioni = new Prenotazione[numeroPrenotazioni];
	}
	
	public int getNumeroFilm() {
		return numeroFilm;
	}
	public void setNumeroFilm(int numeroFilm) {
		this.numeroFilm = numeroFilm;
	}
	public int getNumeroSale() {
		return numeroSale;
	}
	public void setNumeroSale(int numeroSale) {
		this.numeroSale = numeroSale;
	}
	public int getNumeroPrenotazioni() {
		return numeroPrenotazioni;
	}
	public void setNumeroPrenotazioni(int numeroPrenotazioni) {
		this.numeroPrenotazioni = numeroPrenotazioni;
	}
	
	public void prenota() {
		int filmScelto = getIntInput("Tra i film qui in basso scritti quale si sceglie: ");
		programmazioneFilm();
		elencoPrenotazioni[indexPrenotazioni] = new Prenotazione(filmProgrammati[scegliFilm()], elencoSale[scegliSala()]);
		elencoPrenotazioni[indexPrenotazioni].getNumeroSala().prenotaPosto();
		indexPrenotazioni ++;
		
	}
	
	public void programmazioneFilm() {
		for(int i = 0;i < numeroFilm;i++) {
			System.out.print(i+ ") ");
			filmProgrammati[i].visualizzaFilm();
		}
	}
	
	public void visualizzaSale() {
		for(int i = 0;i < numeroFilm;i++) {
			System.out.print(i+ ") ");
			elencoSale[i].visualizzaSala();
		}
	}
	
	public void prenotazioni() {
		for(int i = 0;i < numeroPrenotazioni;i++) {
			elencoPrenotazioni[i].visualizzaPrenotazione();
		}
	}
	
	private int scegliFilm() {
		int filmScelto = getIntInput("Tra i film qui in basso scritti quale si sceglie: ");
		programmazioneFilm();
		while(filmScelto > (numeroFilm-1)) {
			filmScelto = getIntInput("Tra i film qui in basso scritti quale si sceglie: ");
			programmazioneFilm();
		}
		return filmScelto;
	}
	
	private int scegliSala() {
		int sala = getIntInput("Tra le sale qui in basso scritti quale si sceglie: ");
		programmazioneFilm();
		while(sala > (numeroFilm-1)) {
			sala = getIntInput("Tra i film qui in basso scritti quale si sceglie: ");
			programmazioneFilm();
		}
		return sala;
	}
	private int getIntInput(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		while(!input.hasNextInt()) {
			System.out.println(message);
			input.next();
		}
		return input.nextInt();
	}
}
