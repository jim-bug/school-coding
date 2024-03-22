package it.java.gerarchie;

public abstract class Veicolo {
    String marca;
	float velocitaMax;
	float peso;
	String colore;
	int nPosti;
	
	public Veicolo(String marca, float velocitaMax, float peso, String colore, int nPosti) {
		setMarca(marca);
		setVelocitaMax(velocitaMax);
		setPeso(peso);
		setColore(colore);
		setnPosti(nPosti);
	}
	
	public Veicolo() {
		setnPosti(Input.getIntInput("Inserisci il numero massimo di posti del veicolo: "));
		setVelocitaMax(Input.getFloatInput("Inserisci la massima velocità del veicolo: "));
		setPeso(Input.getFloatInput("Inserisci il peso del veicolo: "));
		setColore(Input.getStrInput("Inserisci il colore del veicolo: "));	
		setMarca(Input.getStrInput("Inserisci la marca del veicolo: "));
	}
	
	public abstract void accendiVeicolo();
	public abstract void spegniVeicolo();
	public abstract void spostaVeicolo();

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public float getVelocitaMax() {
		return velocitaMax;
	}

	public void setVelocitaMax(float velocitaMax) {
		this.velocitaMax = velocitaMax;
	}

	public float getPeso() {
		return peso;
	}

	public void setPeso(float peso) {
		this.peso = peso;
	}

	public String getColore() {
		return colore;
	}

	public void setColore(String colore) {
		this.colore = colore;
	}

	public int getnPosti() {
		return nPosti;
	}

	public void setnPosti(int nPosti) {
		this.nPosti = nPosti;
	}
	
}
