package it.java.EsercizioParcheggioConListe;
/**
 * Classe Auto
 * @author Ignazio Leonardo Calogero Sperandeo*/
public class Auto {
	private String marca;
	private String modello;
	private String targa;
	/**
	 * Metodo costruttore, costruttore parametrico, si occupa di assegnare i valori agli attributi di istanza.
	 * @param marca Marca dell'Auto
	 * @param modello Modello dell'Auto
	 * @param targa Targa dell'Auto*/
	public Auto(String marca, String modello, String targa) {
		setMarca(marca);
		setModello(modello);
		setTarga(targa);
	}
	/**
	 * Si occupa di cambiare il valore dell'attributo di istanza marca.
	 * @param marca Nuova marca dell'Auto*/
	public void setMarca(String marca) {
		this.marca = marca;
	}
	/**
	 * Si occupa di cambiare il valore dell'attributo di istanza modello.
	 * @param modello Nuovo modello dell'Auto*/
	public void setModello(String modello) {
		this.modello = modello;
	}
	/**
	 * Si occupa di cambiare il valore dell'attributo di istanza targa.
	 * @param targa Nuova targa dell'Auto*/
	public void setTarga(String targa) {
		this.targa = targa;
	}
	/**
	 * Si occupa di ritornare il valore dell'attributo di istanza marca.
	 * @return marca*/
	public String getMarca() {
		return this.marca;
	}
	/**
	 * Si occupa di ritornare il valore dell'attributo di istanza modello.
	 * @return modello*/
	public String getModello() {
		return this.modello;
	}
	/**
	 * Si occupa di ritornare il valore dell'attributo di istanza targa.
	 * @return targa*/
	public String getTarga() {
		return this.targa;
	}
	/**
	 * Si occupa di ritornare una stringa con un resoconto dell'istanza.
	 * @return String*/
	public String toString() {
		return "Auto: " + this.marca + " " + this.modello + " " + "Targa: " + this.targa;
	}
}
