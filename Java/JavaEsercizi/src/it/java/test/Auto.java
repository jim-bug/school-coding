package it.java.test;

public class Auto extends Veicolo { 
	boolean ariaC;
	String tipoCambio;
	int numeroPortiere;
	
	public Auto(int numeroRuote,
	int numeroFari,
	String cilindrata,
	int posti,
	int specchietti,
	String colore,
	String tipoMotore,
	float velocitàMax,
	String tipoCarburante,
	int marcia,
	boolean accensioneVeic,
	boolean ariaC,
	String tipoCambio,
	int numeroPortiere) {
		
	super(numeroRuote,
	 numeroFari,
	 cilindrata,
	 posti,
	 specchietti,
	 colore,
	 tipoMotore,
	 velocitàMax,
     tipoCarburante,
	 marcia,
	 accensioneVeic);
	this.ariaC = ariaC;
	this.tipoCambio = tipoCambio;
	if(numeroPortiere < 3)
		this.numeroPortiere = 3;
	else
		this.numeroPortiere = numeroPortiere;
		
		
	
	}
	public void setAriaC(boolean ariaC) {
		this.ariaC = ariaC;
	}
	public void setTipoCambio(String tipoCambio) {
		this.tipoCambio = tipoCambio;
	}
	public void setNumeroPortiere(int numeroPortiere) {
		this.numeroPortiere = numeroPortiere;
	}
	
	
	
	
	public boolean getAriaC() {
		return ariaC;
	}
	public String TipoCambio() {
		return tipoCambio;
	}
	public int getNumeroPortiere() {
		return numeroPortiere;
	}
	public void accendiAriaC() {
		this.ariaC = true;
	}
	public void spegniAriaC() {
		this.ariaC = false;
	}
	
}