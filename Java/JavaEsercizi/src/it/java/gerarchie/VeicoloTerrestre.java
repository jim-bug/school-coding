package it.java.gerarchie;

public class VeicoloTerrestre extends Veicolo{
	int nFari;
	int nRuote;
	
	public VeicoloTerrestre(String marca, float velocitaMax, float peso, String colore, int nPosti, int nFari, int nRuote) {
		super(marca, velocitaMax, peso, colore, nPosti);
		setnFari(nFari);
		setnRuote(nRuote);
	}
	
	public VeicoloTerrestre() {
		super();
		System.out.println("##############Input Veicolo Terrestre!##############");
		setnFari(Input.getIntInput("Inserisci il numero di fari: "));
		setnRuote(Input.getIntInput("Inserisci il numero di ruote: "));
	}
	
	@Override
	public void accendiVeicolo() { 		// effettuando l'override dei metodi astratti della superclasse la classe corrente non sarà astratta.
		System.out.println("Avvio sequenza di accensione del veicolo terrestre");
	}
	
	@Override
	public void spegniVeicolo() {
		System.out.println("Avvio sequenza di spegnimento del veicolo terrestre");
	}
	
	@Override 
	public void spostaVeicolo() {
		System.out.println("Il veicolo terrestre è attualmente in accelerazione");
	}
	
	public String toString() {
		return 
				"Informazioni istanza oggetto veicolo terrestre:\n\tMarca: " + getMarca() 
				+ "\n\tVelocita massima: " + getVelocitaMax()
				+ "\n\tPeso: " + getPeso()
				+ "\n\tColore: "  + getColore()
				+ "\n\tNumero posti: " + getnPosti() 
				+ "\n\tNumero ruote: " + getnRuote();
	}

	public int getnFari() {
		return nFari;
	}

	public void setnFari(int nFari) {
		this.nFari = nFari;
	}

	public int getnRuote() {
		return nRuote;
	}

	public void setnRuote(int nRuote) {
		this.nRuote = nRuote;
	}
	
	
	
}
