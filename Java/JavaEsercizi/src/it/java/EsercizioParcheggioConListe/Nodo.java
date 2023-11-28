package it.java.EsercizioParcheggioConListe;
// Lista: insieme finito di nodi.
// Nodi: composti da valore e link all'elemento successivo.
public class Nodo {
	private Posto valore;
	private Nodo next;
	
	public Nodo(Posto valore) {
		this.valore = valore;
		this.next = null;
	}
	
	public void setValore(Posto valore) {
		this.valore = valore;
	}
	
	public Posto getValore() {
		return this.valore;
	}
	
	public void setNext(Nodo next) {
		this.next = next;
	}
	
	public Nodo getNext() {
		return this.next;
	}
	
}
