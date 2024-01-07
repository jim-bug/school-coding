package it.java.esercizioVacanze;

public class Auto {
	private String marca;
	
	public Auto(String marca) {
		setMarca(marca);
	}
	
	public void setMarca(String marca) {
		this.marca = marca;
	}
	
	public String getMarca() {
		return this.marca;
	}
}
