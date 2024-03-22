package it.java.gerarchie;

public class Barca extends VeicoloAcquatico{
	private String tipoBarca;
	private float lunghezza;
	private float larghezza;
	
	public Barca(String marca, float velocitaMax, float peso, String colore, int nPosti, boolean cabina, int nMotori, String materiale, String tipoBarca, float lunghezza, float larghezza) {
		super(marca, velocitaMax, peso, colore, nPosti, cabina, nMotori, materiale);
		setTipoBarca(tipoBarca);
		setLunghezza(lunghezza);
		setLarghezza(larghezza);
	}
	
	public Barca() {
		super();
		System.out.println("##############Input Barca!##############");
		setTipoBarca(Input.getStrInput("Inserisci lo scopo a cui si desta questa barca: "));
		setLunghezza(Input.getFloatInput("Inserisci la lunghezza della barca in m: "));
		setLarghezza(Input.getFloatInput("Inserisci la larghezza della barca in m: "));
	}
	
	@Override
	public void accendiVeicolo() {
		System.out.println("Avvio sequenza di accensione della barca. Sequenza prevista:\n1) Inserimento chiave\n2) Pressione del pulsante di accensione");
	}
	
	@Override
	public void spegniVeicolo() {
		System.out.println("Avvio sequenza di spegnimento della barca. Sequenza prevista:\n1) Interrompi l'accelerazione\n2) Spegni il motore\n3) Estrai la chiave.");
	}
	
	@Override 
	public void spostaVeicolo() {
		System.out.println("La barca è momentaneamente in accelerazione");
	}
	
	public String toString() {
		return 
				"Informazioni istanza oggetto barca:\n\tMarca: " + getMarca() 
				+ "\n\tVelocita massima: " + getVelocitaMax()
				+ "\n\tPeso: " + getPeso()
				+ "\n\tColore: "  + getColore()
				+ "\n\tNumero posti: " + getnPosti() 
				+ "\n\tPresenza cabina: " + isCabina() 
				+ "\n\tNumero motori: " + getnMotori()
				+ "\n\tMateriale: " + getMateriale()
				+ "\n\tLunghezza: " + getLunghezza()
				+ "\n\tLarghezza: " + getLarghezza()
				+ "\n\tTipologia: " + getTipoBarca();
	}

	public String getTipoBarca() {
		return tipoBarca;
	}

	public void setTipoBarca(String tipoBarca) {
		this.tipoBarca = tipoBarca;
	}

	public float getLunghezza() {
		return lunghezza;
	}

	public void setLunghezza(float lunghezza) {
		if(lunghezza > 0) {
			this.lunghezza = lunghezza;
		}
		else {
			this.lunghezza = 0;
		}
		
	}

	public float getLarghezza() {
		return larghezza;
	}

	public void setLarghezza(float larghezza) {
		if(larghezza > 0) {
			this.larghezza = larghezza;
		}
		else {
			this.larghezza = 0;
		}
	}
	
	
}
