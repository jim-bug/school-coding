package it.java.esercizi.classi.ereditarieta;
import java.time.LocalDate;
import java.time.Month;

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
    LocalDate dataDiImmatricolazione;

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
    
//    public void setDataDiImmatricolazione(LocalDate data) {
//    	this.dataDiImmatricolazione = data;
//    }
//    
    public String getDataDiImmatricolazione() {
    	return this.dataDiImmatricolazione.toString();
    }
    
    public int controlloRevisioniFatte(LocalDate dataDiOggi, boolean stampaRevisioneOAnno) {
    	int nRev = 0;
    	int annoImmatricolazione = this.dataDiImmatricolazione.getYear()+4;
    	int annoCorrente = dataDiOggi.getYear();

    	while(annoImmatricolazione < annoCorrente) {
    		annoImmatricolazione += 2;
    		nRev ++;
    	}
    	if (annoImmatricolazione % 2 == 0 && annoCorrente % 2 == 0 || annoImmatricolazione % 2 != 0 && annoCorrente % 2 != 0) {
    		if (this.dataDiImmatricolazione.getMonthValue() == dataDiOggi.getMonthValue()) {
        		nRev++;
        		annoImmatricolazione += 2;
    		}
	
    	}
    	
    	if (stampaRevisioneOAnno) {
    		return nRev;
    	}
    	else {
    		return annoImmatricolazione;	// in questo metodo annoImmatricolazione alla fine del calcolo delle revisioni effettuate fungerà anche come anno di prossima revisione.
    	}
    	
    }
    
    public void controlloRevisioneConGiorno(int numeroDiRevisioniEffettuate) {
    	LocalDate dataDiOggi = LocalDate.now();
    	if(numeroDiRevisioniEffettuate < controlloRevisioniFatte(dataDiOggi, true)) {
    		System.out.println("Devi effettuare immediatamente una revisione per metterti in riga con la legge!");
    	}
    	else {
    		System.out.println("Tutto nella norma, la prossima revisione sarà nel " + controlloRevisioniFatte(dataDiOggi, false));
    	}
    	
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
        String tipoCarburante,
        LocalDate dataDiImmatricolazione
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
    	this.dataDiImmatricolazione = dataDiImmatricolazione;
    }
}