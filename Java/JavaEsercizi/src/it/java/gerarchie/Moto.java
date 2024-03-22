package it.java.gerarchie;

public class Moto extends VeicoloTerrestre{
	private String targa;
	
	public Moto(String marca, float velocitaMax, float peso, String colore, int nPosti, int nFari, int nRuote, String targa) {
		super(marca, velocitaMax, peso, colore, nPosti, nFari, nRuote);
		setTarga(targa);
	}
	
	public Moto() {
		super();
		System.out.println("##############Input Moto!##############");
		setTarga(Input.getStrInput("Inserisci la targa della moto: "));
	}
	
	@Override
	public void accendiVeicolo() {
		System.out.println("Avvio sequenza di accensione della moto. Sequenza prevista:\n1) Inserimento chiave");
	}
	
	@Override
	public void spegniVeicolo() {
		System.out.println("Avvio sequenza di spegnimento della moto. Sequenza prevista:\n1) Ferma la moto\n2) Eestrai la chiave\n3) Metti la moto in sicurezza");
	}
	
	@Override 
	public void spostaVeicolo() {
		System.out.println("La moto è attualmente in accelerazione, l'impugnatura dell'acceleratore è ruotata verso l'alto");
	}
	
	public String toString() {
		return 
				"Informazioni istanza oggetto moto:\n\tMarca: " + getMarca() 
				+ "\n\tVelocita massima: " + getVelocitaMax()
				+ "\n\tPeso: " + getPeso()
				+ "\n\tColore: "  + getColore()
				+ "\n\tNumero posti: " + getnPosti() 
				+ "\n\tNumero ruote: " + getnRuote()
				+ "\n\tNumero fari: " + getnFari() 
				+ "Targa: " + getTarga();
	}
	
	public void setTarga(String targa) {
		this.targa = targa;
	}
	
	public String getTarga() {
		return this.targa;
	}
	

}
