package it.java.EsercizioParcheggio;

public class Auto {
	private String marca;
	private String modello;
	private String targa;
	
	public Auto(String marca, String modello, String targa) {
		setMarca(marca);
		setModello(modello);
		setTarga(targa);
	}
	
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public void setModello(String modello) {
		this.modello = modello;
	}
	public void setTarga(String targa) {
		this.targa = targa;
	}
	public String getMarca() {
		return this.marca;
	}
	public String getModello() {
		return this.modello;
	}
	public String getTarga() {
		return this.targa;
	}
	
}
