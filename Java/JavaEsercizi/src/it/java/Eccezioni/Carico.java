package it.java.Eccezioni;

import java.time.LocalTime;
import java.util.Scanner;

public class Carico {
	private double pesoCarico;
	private String tipoCarico;
	private String nomeCarico;
	private String provenienzaCarico;
	private String destinazioneCarico;
	private double distanzaDestinazione;
	private LocalTime tempoStimato;
	private Cliente cliente;
	
	public Carico() {
		setPesoCarico(getInputDouble("Inserisci il peso del carico: "));
		setTipoCarico(getInputStr("Inserisci il tipo di carico: "));
		setNomeCarico(getInputStr("Inserisci il nome del carico: "));
		setProvenienzaCarico(getInputStr("Inserisci la provenienza del carico: "));
		setDestinazioneCarico(getInputStr("Inserisci la destinazione del carico: "));
		setDistanzaDestinazione(getInputDouble("Inserisci la distanza della destinazione: "));
		this.cliente = new Cliente();
	}
	
	public LocalTime getTempoStimato() {
		return tempoStimato;
	}

	public void setTempoStimato(LocalTime tempoStimato) {
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
				"Nome Carico: " + getNomeCarico() + "\n"
				+ "Peso carico: " + getPesoCarico() + "\n"
				+ "Tipo carico: " + getPesoCarico() + "\n"
				+ "Provenienza carico: " + getProvenienzaCarico() + "\n"
				+ "Destinazione carico: " + getDestinazioneCarico() + "\n"
				+ "Distanza: " + getDistanzaDestinazione() + "\n"
				+ "Committente: " + getCliente().getNomeAzienda();
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
