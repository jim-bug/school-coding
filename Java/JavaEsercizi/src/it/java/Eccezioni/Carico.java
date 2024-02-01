package it.java.Eccezioni;

import java.time.Duration;
import java.util.Scanner;

public class Carico {
	private double pesoCarico;
	private String tipoCarico;
	private String nomeCarico;
	private String provenienzaCarico;
	private String destinazioneCarico;
	private double distanzaDestinazione;
	private Duration tempoStimato;
	private Cliente cliente;
	
	public Carico(int contaCarichi) {
		this.cliente = new Cliente();
		setNomeCarico(getInputStr("Inserisci il nome del carico: "));
		setPesoCarico(getInputDouble("Inserisci il peso del carico in Kg: "));
		setTipoCarico(getInputStr("Inserisci il tipo di carico: "));
		if(contaCarichi < 1) {
			setProvenienzaCarico(getInputStr("Inserisci la provenienza del carico: "));
		}
		else {
			System.out.println("La provenienza non è necessaria!");
		}
		setDestinazioneCarico(getInputStr("Inserisci la destinazione del carico: "));
		setDistanzaDestinazione(getInputDouble("Inserisci la distanza della destinazione in Km: "));
		contaCarichi ++;
	
	}
	


	public Duration getTempoStimato() {
		return tempoStimato;
	}

	public void setTempoStimato(Duration tempoStimato) {
		this.tempoStimato = tempoStimato;
	}

	public double getDistanzaDestinazione() {
		return distanzaDestinazione;
	}

	public void setDistanzaDestinazione(double distanzaDestinazione) {
		this.distanzaDestinazione = distanzaDestinazione;
	}

	public double getPesoCarico() {
		return pesoCarico;
	}

	public void setPesoCarico(double pesoCarico) {
		this.pesoCarico = pesoCarico;
	}

	public String getTipoCarico() {
		return tipoCarico;
	}

	public void setTipoCarico(String tipoCarico) {
		this.tipoCarico = tipoCarico;
	}
	
	public String getNomeCarico() {
		return nomeCarico;
	}

	public void setNomeCarico(String nomeCarico) {
		this.nomeCarico = nomeCarico;
	}

	public String getProvenienzaCarico() {
		return provenienzaCarico;
	}

	public void setProvenienzaCarico(String provenienzaCarico) {
		this.provenienzaCarico = provenienzaCarico;
	}

	public String getDestinazioneCarico() {
		return destinazioneCarico;
	}

	public void setDestinazioneCarico(String destinazioneCarico) {
		this.destinazioneCarico = destinazioneCarico;
	}
	
	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public String toString() {
		String resocontoCarico = 
				"Nome Carico: " + getNomeCarico() + "\n\t"
				+ "Peso carico: " + getPesoCarico() + "\n\t"
				+ "Tipo carico: " + getTipoCarico() + "\n\t"
				+ "Provenienza carico: " + getProvenienzaCarico() + "\n\t"
				+ "Destinazione carico: " + getDestinazioneCarico() + "\n\t"
				+ "Distanza: " + getDistanzaDestinazione() + "\n\t"
				+ "Committente: " + getCliente().getNomeAzienda() + "\n\t"
				+ "Tempo stimato di arrivo: " + getTempoStimato() + " ore"; 
		return resocontoCarico;
	}

	private String getInputStr(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
	
	private int getInputInt(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		while(!input.hasNextInt()) {
			System.out.println(message);
			input.next();
		}
		return input.nextInt();
	}
	
	private double getInputDouble(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		while(!input.hasNextDouble()) {
			System.out.println(message);
			input.next();
		}
		return input.nextDouble();
	}
}
