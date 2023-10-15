package it.java.test;

public class Veicolo {
	int numeroRuote;
	int numeroFari;
	String cilindrata;
	int posti;
	int specchietti;
	String colore;
	String tipoMotore;
	float velocitàMax;
	String tipoCarburante;
	int marcia;
	boolean accensioneVeic;
	public Veicolo(int numeroRuote, int numeroFari, String cilindrata, int posti,
			int specchietti, String colore, String tipoMotore, float velocitàMax, String tipoCarburante,
			int marcia, boolean accensioneVeic)
			{
				setNumeroRuote(numeroRuote);
				setNumeroFari(numeroFari);
				setCilindrata(cilindrata);
				setPosti(posti);
				setSpecchietti(specchietti);
				setColore(colore);
				setTipoMotore(tipoMotore);
				setVelocitàMax(velocitàMax);
				setTipoCarburante(tipoCarburante);
				setMarcia(marcia);
				setAccensioneVeic(accensioneVeic);
				}
			public void setNumeroRuote(int numeroRuote) {
				if(numeroRuote < 2)
					this.numeroRuote = 2;
				else
					this.numeroRuote = numeroRuote; 
			}
			public void setNumeroFari(int numeroFari) {
				if(numeroFari < 1)
					this.numeroFari = 1;
				else
					this.numeroFari = numeroFari;
			}
			public void setCilindrata(String cilindrata) {
				this.cilindrata = cilindrata;
			}
			public void setPosti(int posti) {
				if(posti <= 0) 
					this.posti = 1;
				else
					this.posti = posti;
			}
			public void setSpecchietti(int specchietti) {
				if(specchietti < 2)
					this.specchietti = 2;
				else
					this.specchietti = specchietti;
			}
			public void setColore(String colore) {
				this.colore = colore;
			}
			public void setTipoMotore(String tipoMotore) {
				this.tipoMotore = tipoMotore;
			}
			public void setVelocitàMax(float velocitàMax) {
				if(velocitàMax < 0)
					velocitàMax = 0;
				else
					this.velocitàMax = velocitàMax;
			}
			public void setTipoCarburante(String tipoCarburante) {
				this.tipoCarburante = tipoCarburante;
			}
			public void setMarcia(int marcia) {
				if(marcia < 1)
					this.marcia = 1;
				else
					this.marcia = marcia;
			}
			public void setAccensioneVeic(boolean accensioneVeic) {
				this.accensioneVeic = accensioneVeic;
			}

			public int getNumeroRuote() {
				return numeroRuote;
			}
			public int getNumeroFari() {
				return numeroFari;
			}
			public String getCilindrata() {
				return cilindrata;
			}
			public int getPosti() {
				return posti;
			}
			public int getSpecchietti() {
				return specchietti;
			}
			public String getColore() {
				return colore;
			}
			public String getTipoMotore() {
				return tipoMotore;
			}
			public float getVelocitàMax() {
				return velocitàMax;
			}
			public String getTipoCarburante() {
				return tipoCarburante;
			}
			public int getMarcia() {
				return marcia;
			}
			public boolean getAccensioneVeic() {
				return accensioneVeic;
			}
			public float accelera() {
				this.velocitàMax = (float) (velocitàMax + 0.5);
				return velocitàMax;
			}
			public float frena() {
				this.velocitàMax = (float) (velocitàMax - 0.5);
				return velocitàMax;
			}
			public void marciaSu() {
				if (marcia < 6)
					this.marcia = marcia+1;
				}
			public void marciaGiu() {
				this.marcia = marcia-1;
			}
			public void accendi() {
				this.accensioneVeic = true;
			}
			public void spegni() {
				this.accensioneVeic = false;
			}
} 