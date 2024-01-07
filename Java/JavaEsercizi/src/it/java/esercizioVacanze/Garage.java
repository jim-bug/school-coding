package it.java.esercizioVacanze;
import java.util.Random;
public class Garage {
	private String[][] mappa = new String[2][5];
	private int contaAuto = 0;
	private String[] targheUsate = new String[10];
	
	public Garage() {
		for(int i = 0; i < 2;i++) {
			for (int j = 0; j < 5;j++) {
				mappa[i][j] = "0";	// pongo tutti i posti di entrambi piani vuoti
			}
		}
	}
	public void ingresso() {
		int piano;
		int posto;
		int[] posizioni = new int[2];
		posizioni = controlloDisponibilita(true, "1");
		piano = posizioni[0];
		posto = posizioni[1];
		if (piano == -1) {
			System.out.println("POSTI ESAURITI");
		}
		else {
			String targa = generaTarga();
			mappa[piano][posto] = targa;
			System.out.println("Targa: " + targa + " Assegnata al piano: " + piano + " Assegnata al posto: " + posto);
			contaAuto += 1;
		}
	}
	
	public void uscita(String targa) {
		int piano;
		int posto;
		int[] posizioni = new int[2];
		posizioni = controlloDisponibilita(false, targa);
		piano = posizioni[0];
		posto = posizioni[1];
		mappa[piano][posto] = "0";
		System.out.println("Targa: " + targa + "\nUscita dal piano: " + piano + "\n Uscita dal posto: " + posto);
		contaAuto --;
	}
	public void mappaGarage() {
		for(int i = 0;i < 2;i++) {
			System.out.println("Piano: " + (int)(i+1));
			for (int j = 0; j < 5;j++) {
				if(mappa[i][j].equals("0")) {
					System.out.println("Posto: " + (int) (j+1) + " LIBERO");
				}
				else {
					System.out.println("Posto: " + (int) (j+1) + " " +mappa[i][j]);
				}
			}
		}
	}
	private String generaTarga() {
		Random rand = new Random();
		int maxLenght = 6;
		while (true){
			String targaCompleta = "";
			char[] targa = new char[maxLenght];
			for(int i = 0;i < maxLenght;i++) {
				targa[i] = (char)(rand.nextInt(26) + 64);
			}
			targaCompleta = new String(targa);
			if (ricercaSequenziale(targheUsate, targaCompleta)) {
				continue;
			}
			else {
				return targaCompleta;
			}
		}
		
	}
	public int getContaAuto() {
		return contaAuto;
	}
	public void setContaAuto(int contaAuto) {
		this.contaAuto = contaAuto;
	}
	private boolean ricercaSequenziale(String[] source, String key) {
		for(int i = 0;i < source.length;i++) {
			if (source[i] == key) {
				return true;
			}
		}
		return false;
	}
	private int[] controlloDisponibilita(boolean trovaVeicolo, String targa) {
		int[] posizioni = new int[2];
		posizioni[0] = -1;
		posizioni[1] = -1;
		for(int i = 0;i < 2; i++) {
			for (int j = 0;j < 5;j++) {
				if(mappa[i][j].equals("0") && trovaVeicolo) {
					posizioni[0] = i;
					posizioni[1] = j;
					return posizioni;
				}
				if(mappa[i][j].equals(targa)){
					posizioni[0] = i;
					posizioni[1] = j;
					return posizioni;
				}
			}
		}
		return posizioni;
	}
	private int trovaVeicolo(String targa) {
		for (int i = 0;i < 2;i++) {
			for (int j = 0;j < 5;j++) {
				if (mappa[i][j].equals(targa)) {
					return i;
				}
			}
		}
		return -1;
	}
}
