package it.java.Liste;

public class Main {

	public static void main(String[] args) {
		Lista lista = new Lista();
		lista.inserisci("ciao");
		lista.inserisci("come");
		lista.inserisci("stai");
		lista.inserisci("spero");
		lista.inserisci("bene");
		lista.inserisci("dai");
		lista.stampa();
		System.out.println(lista.len);
	}

}
