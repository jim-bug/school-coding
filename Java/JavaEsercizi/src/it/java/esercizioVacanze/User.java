package it.java.esercizioVacanze;
import java.util.Scanner;
public class User {
	private String nome;
	private String password;
	
	public User() {
		setNome(getInputStr("Inserisci il nome dell'utente: "));
		setPassword(getInputStr("Inserisci la password dell'utente: "));
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getNome() {
		return this.nome;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public boolean login() {
		String nome = getInputStr("Inserisci il nome per l'autenticazione: ");
		String password = getInputStr("Inserisci la password per l'autenticazione: ");
		Scanner input = new Scanner(System.in);
		while (!nome.equals(this.nome) && !password.equals(this.password)) {
			nome = getInputStr("Re-Inserisci il nome per l'autenticazione: ");
			password = getInputStr("Re-Inserisci la password per l'autenticazione: ");
		}
		return true;
	}
	
	private String getInputStr(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
	
}
