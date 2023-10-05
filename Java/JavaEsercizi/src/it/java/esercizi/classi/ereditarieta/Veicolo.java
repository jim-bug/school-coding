package it.java.esercizi.classi.ereditarieta;


public class Veicolo{
    // I metodi get e set servono si vuole visualizzare a video i valori degli attributi o modificare i valori degli attributi.
    private int numeroRuote;
    private int numeroFari;
    private String cilindrata;
    private int numeroPosti;
    private int numeroSpecchietti;
    private String coloreVeicolo;
    private String tipoMotore;
    private float velocitaMax;
    private String tipoCarburante;

    public int getNumeroRuote() {
        return this.numeroRuote;
    }

    public void setNumeroRuote(int numeroRuote) {
        this.numeroRuote = numeroRuote;
    }

    public int getNumeroFari() {
        return this.numeroFari;
    }

    public void setNumeroFari(int numeroFari) {
        this.numeroFari = numeroFari;
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
        this.numeroSpecchietti = numeroSpecchietti;
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
        this.velocitaMax = velocitaMax;
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
        String tipoColore,
        int velocitaMax,
        String tipoCarburante
    ){
        this.numeroRuote = numeroRuote;
        this.numeroFari = numeroFari;
        this.cilindrata = cilindrata;
        this.numeroPosti = numeroPosti;
        this.numeroSpecchietti = numeroSpecchietti;
        this.coloreVeicolo = coloreVeicolo;
        this.tipoMotore = tipoCarburante;
        this.velocitaMax = velocitaMax;
        this.tipoCarburante = tipoCarburante;
    }

}
