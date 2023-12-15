package it.java.ListaHash;
// Lista: insieme finito di nodi.
// Nodi: composti da valore e link all'elemento successivo.
public class Nodo {
	private String key;
	private String value;
	private Nodo next;
	public Nodo(String key, String value) {
		this.key = key;
		this.value = value;
		this.next = null;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Nodo getNext() {
		return next;
	}
	public void setNext(Nodo next) {
		this.next = next;
	}
	
	
	
}
