package it.java.gerarchie;

public class Hovercraft extends VeicoloTerrestre implements Acquatico{
	private boolean cabina;
	private int nMotori;
	private String materiale;
	
	public Hovercraft(String marca, float velocitaMax, float peso, String colore, int nPosti, int nFari, boolean cabina, int nMotori, String materiale) {
		super(marca, velocitaMax, peso, colore, nPosti, nFari, 0);
		setCabina(cabina);
		setnMotori(nMotori);
		setMateriale(materiale);
	}
	
	public Hovercraft() {
		super();
		System.out.println("##############Input Veicolo Hovercraft!##############");
		setCabina(Input.getBoolInput("l'Hovercraft ha una cabina? "));
		setnMotori(Input.getIntInput("Inserisci il numero di motori del'hovercraft"));
		setMateriale(Input.getStrInput("Inserisci il materiale dell'hovercraft: "));
	}
	
	@Override
	public void accendiVeicolo() {
		System.out.println("Avvio sequenza di accensione dell'hovercraft. Sequenza prevista:\n1) Inserimento chiave\n2) Pressione del pulsante di accensione");
	}
	
	@Override
	public void spegniVeicolo() {
		System.out.println("Avvio sequenza di spegnimento dell'hovercraft. Sequenza prevista:\n1) Interrompi l'accelerazione\n2) Spegni il motore\n3) Estrai la chiave.");
	}
	
	@Override 
	public void spostaVeicolo() {
		System.out.println("L'hovercraft è momentaneamente in accelerazione");
	}
	
	public boolean isCabina() {
		return cabina;
	}
	
	@Override
	public void ormeggia() {		// implemento l'azione dichiarata dall'interfaccia.
		System.out.println("L'hovercraft ha calato l'ancora.");
	}
	
	@Override
	public void accosta() {			// implemento l'azione dichiarata dall'interfaccia.
		System.out.println("L'Hovercraft si è accostato con un altro veicolo acquatico.");
	}
	
	public String toString() {
		return 
				"Informazioni istanza oggetto hovercraft:\n\tMarca: " + getMarca() 
				+ "\n\tVelocita massima: " + getVelocitaMax()
				+ "\n\tPeso: " + getPeso()
				+ "\n\tColore: "  + getColore()
				+ "\n\tNumero posti: " + getnPosti() 
				+ "\n\tPresenza cabina: " + isCabina() 
				+ "\n\tNumero motori: " + getnMotori()
				+ "\n\tMateriale: " + getMateriale()
				+ "\n\tNumero fari: " + getnFari();
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
