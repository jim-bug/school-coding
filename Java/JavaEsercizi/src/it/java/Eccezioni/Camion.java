package it.java.Eccezioni;
import java.util.ArrayList;
import java.util.Scanner;
import java.time.LocalTime;

public class Camion {
	public static final double velocitaMedia = 100; 
	private String targa;

	private ArrayList<Carico> carichi = new ArrayList<Carico>();
	
	public Camion() {
		setTarga(getInputStr("Inserisci la targa del camion: "));
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
		carichi.add(carico);
	}
	
	public void setTime() {
		for(Carico i : carichi) {
			i.setTempoStimato(LocalTime.ofSecondOfDay((long)(i.getDistanzaDestinazione()/velocitaMedia))); 
		}
	}
	public void getCarico() {
		for(Carico i : carichi) {
			i.toString();
		}
	}
	
	private String getInputStr(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
}
