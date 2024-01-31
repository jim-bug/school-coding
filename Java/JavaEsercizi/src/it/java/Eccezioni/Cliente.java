package it.java.Eccezioni;
import java.util.Scanner;

public class Cliente {
	private String nomeAzienda;
	
	public Cliente() {
		setNomeAzienda(getInputStr("Inserisci il nome dell'azienda: "));
	}

	public String getNomeAzienda() {
		return nomeAzienda;
	}
	
	public void setNomeAzienda(String nomeAzienda) {
		this.nomeAzienda = nomeAzienda;
	}
	
	private String getInputStr(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}

}
