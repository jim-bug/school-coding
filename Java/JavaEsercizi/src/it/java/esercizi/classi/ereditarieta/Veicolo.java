package it.java.esercizi.classi.ereditarieta;


public class Veicolo{
    // I metodi get e set servono si vuole visualizzare a video i valori degli attributi o modificare i valori degli attributi.
    int numeroRuote;
    int numeroFari;
    String cilindrata;
    int numeroPosti;
    int numeroSpecchietti;
    String coloreVeicolo;
    String tipoMotore;
    float velocitaMax;
    String tipoCarburante;

    public int getNumeroRuote() {
        return this.numeroRuote;
    }

    public void setNumeroRuote(int numeroRuote) {
    	if (numeroRuote != 2 && numeroRuote != 4 && numeroRuote != 6) {
    		this.numeroRuote = 0;
    	}
    	else {
    		this.numeroRuote = numeroRuote;
    	}
    }

    public int getNumeroFari() {
       return this.numeroFari;

    }

    public void setNumeroFari(int numeroFari) {
       	if (numeroFari != 2 && numeroFari != 4) {
    		this.numeroFari = 0;
    	}
    	else {
    		this.numeroFari = numeroFari;
    	}
    }

    public String getCilindrata() {
        return this.cilindrata;
    }

    public void setCilindrata(String cilindrata) {
        this.cilindrata = cilindrata;
    }

    public int getNumeroPosti() {
        return this.numeroPosti;
    }

    public void setNumeroPosti(int numeroPosti) {
        this.numeroPosti = numeroPosti;
    }

    public int getNumeroSpecchietti() {
        return this.numeroSpecchietti;
    }

    public void setNumeroSpecchietti(int numeroSpecchietti) {
    	if (numeroSpecchietti != 3 && numeroSpecchietti != 2) {
    		this.numeroSpecchietti = 0;
    	}
    	else {
    		this.numeroSpecchietti = numeroSpecchietti;
    	}
    }

    public String getColoreVeicolo() {
        return this.coloreVeicolo;
    }

    public void setColoreVeicolo(String coloreVeicolo) {
        this.coloreVeicolo = coloreVeicolo;
    }

    public String getTipoMotore() {
        return this.tipoMotore;
    }

    public void setTipoMotore(String tipoMotore) {
        this.tipoMotore = tipoMotore;
    }

    public float getVelocitaMax() {
        return this.velocitaMax;
    }

    public void setVelocitaMax(float velocitaMax) {
       	if (velocitaMax < 0) {
    		this.velocitaMax = 0;
    	}
    	else {
    		this.velocitaMax = velocitaMax;
    	}
    }

    public String getTipoCarburante() {
        return this.tipoCarburante;
    }

    public void setTipoCarburante(String tipoCarburante) {
        this.tipoCarburante = tipoCarburante;
    }

    public Veicolo(
        int numeroRuote, 
        int numeroFari,
        String cilindrata,
        int numeroPosti,
        int numeroSpecchietti,
        String coloreVeicolo,
        String tipoMotore,
        float velocitaMax,
        String tipoCarburante
    ){
    	// uso i metodi per l'assegnazione dei parametri agli attributi di istanza per evitare di effettuare due volte i stessi controlli.
    	setVelocitaMax(velocitaMax);
    	setNumeroRuote(numeroRuote);
    	setNumeroFari(numeroFari);
    	setCilindrata(cilindrata);
    	setNumeroPosti(numeroPosti);
    	setNumeroSpecchietti(numeroSpecchietti);
    	setColoreVeicolo(coloreVeicolo);
    	setTipoMotore(tipoMotore);
    	setTipoCarburante(tipoCarburante);  	
    }
}