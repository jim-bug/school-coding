package it.java.esercizi.classi.ereditarieta;


public class Auto extends Veicolo{
	int numeroPorte;
	int numeroAirBag;
	int numeroFinestrini;
	String targa;
	public Auto(
		int numeroRuote, 
        int numeroFari,
        String cilindrata,
        int numeroPosti,
        int numeroSpecchietti,
        String coloreVeicolo,
        String tipoMotore,
        float velocitaMax,
        String tipoCarburante,
        int numeroPorte,
        int numeroAirBag,
        int numeroFinestrini,
        String targa
        ){
		// siccome alcuni parametri sono uguali a quelli del costruttore della superclasse, uso la funzione super()
		super(
				numeroRuote, 
    			numeroFari, 
    			cilindrata, 
    			numeroPosti, 
    			numeroSpecchietti, 
    			coloreVeicolo,
    			tipoMotore,
    			velocitaMax,
    			tipoCarburante
			);
		setNumeroAirBag(numeroAirBag);
		setNumeroPorte(numeroPorte);
		setNumeroFinestrini(numeroFinestrini);
		setTarga(targa);
		
	}
	public void setTarga(String targa) {
		if(targa.length() != 7) {
			this.targa = "XX XXXXX";
		}
		else {
			this.targa = targa;
		}
		
	}
	public String getTarga() {
		return this.targa;
	}
	public void setNumeroFinestrini(int numeroFinestrini) {
		if (numeroFinestrini != 2 && numeroFinestrini != 4) {
			this.numeroFinestrini = 1;
		}
		else {
			this.numeroFinestrini = numeroFinestrini;
		}
	}
	public int getnumeroFinestrini() {
		return this.numeroFinestrini;
	}
	public void setNumeroPorte(int numeroPorte) {
		if(numeroPorte != 3 && numeroPorte != 5) {
			this.numeroPorte = 1;
		}
		else {
			this.numeroPorte = numeroPorte;
		}
	}
	public int getNumeroPorte() {
		return this.numeroPorte;
	}
	public void setNumeroAirBag(int numeroAirBag) {
		this.numeroAirBag = numeroAirBag;
	}
	public int getNumeroAirBag() {
		return this.numeroAirBag;
	}
	public void scoppiaAirBag(int quantitaAirBag) {
		this.numeroAirBag -= quantitaAirBag;
		if (this.numeroAirBag < 0) {
			this.numeroAirBag = 1;
		}
	}
	public void apriPorta(String tipoPorta) {
		System.out.println("è stata aperta la porta: " + tipoPorta);
	}
	
}
