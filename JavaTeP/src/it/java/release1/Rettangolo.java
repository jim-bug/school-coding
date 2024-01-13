package it.java.release1;

import java.util.Scanner;

public class Rettangolo {
	private double lunghezza = 0;
	private double larghezza = 0;
	


	public Rettangolo(String lunghezza, String larghezza) {
		setLunghezza(lunghezza);
		setLarghezza(larghezza);
	}
	
	public Rettangolo() {
		setLunghezza(getStrInput("Inserisci la lunghezza della stanza: "));
		setLarghezza(getStrInput("Inserisci la larghezza della stanza: "));
	}

	public double getLunghezza() {
		return lunghezza;
	}

	public void setLunghezza(String lunghezza) {
		try {
			this.lunghezza = Double.parseDouble(lunghezza);
			if(this.lunghezza < 0) {
				System.out.println("Input non valido");
				this.lunghezza = 0;
			}
		}
		catch(NumberFormatException e){		// se la conversione da stringa a intero solleva un eccezione l'input non è valido.
			System.out.println("Input non valido");
		}
	}

	public double getLarghezza() {
		return larghezza;
	}

	public void setLarghezza(String larghezza) {
		try {
			this.larghezza = Double.parseDouble(larghezza);
			if(this.larghezza < 0) {
				System.out.println("Input non valido");
				this.larghezza = 0;
			}
		}
		catch(NumberFormatException e){		// se la conversione da stringa a intero solleva un eccezione l'input non è valido.
			System.out.println("Input non valido");
		}
	}
	
	public double getArea() {
		return this.lunghezza*this.larghezza;
	}

	public double getPerimetro() {
		return (double)((this.lunghezza+this.larghezza)*2);
	}

	private String getStrInput(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
}
