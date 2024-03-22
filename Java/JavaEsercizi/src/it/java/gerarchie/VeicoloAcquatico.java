package it.java.gerarchie;

public class VeicoloAcquatico extends Veicolo {
	boolean cabina;
	int nMotori;
	String materiale;
	
	public VeicoloAcquatico(String marca, float velocitaMax, float peso, String colore, int nPosti, boolean cabina, int nMotori, String materiale) {
		super(marca, velocitaMax, peso, colore, nPosti);
		setCabina(cabina);
		setnMotori(nMotori);
		setMateriale(materiale);
		
	}
	
	public VeicoloAcquatico() {
		super();
		System.out.println("##############Input Veicolo Acquatico!##############");
		setCabina(Input.getBoolInput("Il veicolo acquatico ha una cabina? "));
		setnMotori(Input.getIntInput("Inserisci il numero di motori del veicolo acquatico"));
		setMateriale(Input.getStrInput("Inserisci il materiale del veicolo acquatico: "));
	}
	
	@Override
	public void accendiVeicolo() {
		System.out.println("Avvio sequenza di accensione del veicolo acquatico");
	}
	
	@Override
	public void spegniVeicolo() {
		System.out.println("Avvio sequenza di spegnimento del veicolo acquatico");
	}
	
	@Override 
	public void spostaVeicolo() {
		System.out.println("Il veicolo acquatico attualmente si sta muovendo in mare");
	}
	
	public String toString() {
		return 
				"Informazioni istanza oggetto veicolo acquatico:\n\tMarca: " + getMarca() 
				+ "\n\tVelocita massima: " + getVelocitaMax()
				+ "\n\tPeso: " + getPeso()
				+ "\n\tColore: "  + getColore()
				+ "\n\tNumero posti: " + getnPosti() 
				+ "\n\tPresenza cabina: " + isCabina() 
				+ "\n\tNumero motori: " + getnMotori()
				+ "\n\tMateriale: " + getMateriale();
	}

	public boolean isCabina() {
		return cabina;
	}

	public void setCabina(boolean cabina) {
		this.cabina = cabina;
	}

	public int getnMotori() {
		return nMotori;
	}

	public void setnMotori(int nMotori) {
		this.nMotori = nMotori;
	}

	public String getMateriale() {
		return materiale;
	}

	public void setMateriale(String materiale) {
		this.materiale = materiale;
	}
	
	
}
