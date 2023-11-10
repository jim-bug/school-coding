package it.java.Liste;
// Lista: insieme finito di nodi.
// Nodi: composti da valore e link all'elemento successivo.
public class Nodo {
	private String valore;
	private Nodo next;
	
	public Nodo(String valore) {
		this.valore = valore;
		this.next = null;
	}
	
	public void setValore(String valore) {
		this.valore = valore;
	}
	
	public String getValore() {
		return this.valore;
	}
	
	public void setNext(Nodo next) {
		this.next = next;
	}
	
	public Nodo getNext() {
		return this.next;
	}
	
}
