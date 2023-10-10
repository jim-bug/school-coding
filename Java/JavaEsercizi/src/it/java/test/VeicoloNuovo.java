package it.java.test;

public class VeicoloNuovo {
	protected int numeroRuote;
	private int NumeroFari;
	private String Cilindrata;
	private int posti;
	private int specchietti;
	private String colore;
	private String tipoMotore;
	private float velocitaMax;
	private String tipoCarburante;
	
	public VeicoloNuovo(int numeroRuote, int numeroFari, String Cilindrata, int posti, int specchietti, String colore, String tipoMotore,float velocitaMax, String tipoCarburante) {
		setNumeroRuote(numeroRuote);
		setNumeroFari(numeroRuote);
	}

	public int getNumeroRuote() {
		return numeroRuote;
	}

	public void setNumeroRuote(int numeroRuote) {
		if(numeroRuote > 5) {
			this.numeroRuote = 2;
		}
		else {
			this.numeroRuote = numeroRuote;
		}
		this.numeroRuote = numeroRuote;
	}

	public int getNumeroFari() {
		return NumeroFari;
	}

	public void setNumeroFari(int numeroFari) {
		NumeroFari = numeroFari;
	}

	public String getCilindrata() {
		return Cilindrata;
	}

	public void setCilindrata(String cilindrata) {
		Cilindrata = cilindrata;
	}

	public int getPosti() {
		return posti;
	}

	public void setPosti(int posti) {
		this.posti = posti;
	}

	public int getSpecchietti() {
		return specchietti;
	}

	public void setSpecchietti(int specchietti) {
		this.specchietti = specchietti;
	}

	public String getColore() {
		return colore;
	}

	public void setColore(String colore) {
		this.colore = colore;
	}

	public String getTipoMotore() {
		return tipoMotore;
	}

	public void setTipoMotore(String tipoMotore) {
		this.tipoMotore = tipoMotore;
	}

	public float getVelocitaMax() {
		return velocitaMax;
	}

	public void setVelocitaMax(float velocitaMax) {
		this.velocitaMax = velocitaMax;
	}

	public String getTipoCarburante() {
		return tipoCarburante;
	}

	public void setTipoCarburante(String tipoCarburante) {
		this.tipoCarburante = tipoCarburante;
	}   
	

	
	
}
