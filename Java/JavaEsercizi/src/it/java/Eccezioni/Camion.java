package it.java.Eccezioni;
import java.util.ArrayList;
import java.util.Scanner;
import java.time.Duration;
import java.util.Random;

public class Camion {
	public static final double VELOCITA_MEDIA = 100; 
	private String targa;
	private double pesoMax;
	private ArrayList<Carico> carichi = new ArrayList<Carico>();
	private String nuovaProvenienza;
	private boolean statoPartenza;
	
	public Camion() {
		setTarga(generateTarga());
		setPesoMax(getInputDouble("Inserisci il peso massimo in Kg, del camion targato: " + getTarga()));
	}

	public boolean isStatoPartenza() {
		return statoPartenza;
	}

	public void setStatoPartenza(boolean statoPartenza) {
		this.statoPartenza = statoPartenza;
	}

	public double getPesoMax() {
		return pesoMax;
	}

	public void setPesoMax(double pesoMax) {
		this.pesoMax = pesoMax;
	}

	public String getTarga() {
		return targa;
	}

	public void setTarga(String targa) {
		this.targa = targa;
	}

	public ArrayList<Carico> getCarichi() {
		return carichi;
	}

	public void setCarichi(ArrayList<Carico> carichi) {
		this.carichi = carichi;
	}
	
	public void inserisciCarico(Carico carico) {
		char caricoScelto;
		if(carichi.size() >= 1) {
			carico.setProvenienzaCarico(nuovaProvenienza); // faccio in modo che il camion non torni alla sede centrale ma parta dall'ultima destinazione.
		}
		while(!testPeso(carico)) {
			System.out.println("Il camion pesa troppo, non è garantita sicurezza, perciò rimuovere un carico.");
			getCarico();
			caricoScelto = getInputStr("Tra i carichi qui stampati, quale si vuole rimuovere, digitare n per non rimuovere nessun carico e annullare la partenza: ").charAt(0);
			if(caricoScelto == 'n') {
				System.exit(0);
			}
		}
		carichi.add(carico);
		setTime();
		nuovaProvenienza = carico.getDestinazioneCarico();
	}
	
	public void setTime() {
		for(Carico i : carichi) {
			i.setTempoStimato(Duration.ofHours((long)(i.getDistanzaDestinazione()/VELOCITA_MEDIA))); // formula inversa per trovare il tempo, .ofSecondOfDay() torna un oggetto LocalTime dato un numero di secondi.
		}
	}

	public void getCarico() {
		System.out.println("Il camion con targa: " + getTarga() + " trasporta " + carichi.size() + " carichi");
		int y = 0;
		for(Carico i : carichi) {
			System.out.print((int)(y+1) +") " + i.toString());
			y ++;
		}
		if(y == 0) {
			System.out.println("Nessun carico ancora presente sul camion!");
		}
	}
	
	public String toString() {
		String resocontoCamion = 
				"Targa Camion: " + getTarga() + "\n"
				+ "Carichi presenti: " + getCarichi().size()
				+ "Stato partenza: " + isStatoPartenza();
		return resocontoCamion;
				
	}
	
	private String getInputStr(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
	
	private double getInputDouble(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		while(!input.hasNextDouble()) {
			System.out.println(message);
			input.next();
		}
		return input.nextDouble();
	}
	
	private int getInputInt(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		while(!input.hasNextInt()) {
			System.out.println(message);
			input.next();
		}
		return input.nextInt();
	}
	
	private boolean testPeso(Carico carico) {
		double pesoTotale = 0;
		if(carichi.size() == 0) {
			pesoTotale = carico.getPesoCarico();
		}
		else {
			for(Carico i : carichi) {
				pesoTotale += i.getPesoCarico();
			}
		}
		if(pesoTotale > pesoMax) {
			return false;
		}
		else {
			return true;
		}
	}
	
	private String generateTarga() {
		int lunghezzaTarga = 6;
		char[] targa = new char[lunghezzaTarga];
		for(int i = 0; i < lunghezzaTarga;i++) {
			Random rand = new Random();
			targa[i] = (char)(rand.nextInt(26) + 64);
		}
		return new String(targa);
	}
}
