package it.java.ListaHash;

public class Lista {
	private Nodo head = null;
	private Nodo tail = null;
	private int len;
	
	public void inserisci(String key, String value) {
		Nodo n = new Nodo(key, value);
		
		if(head == null) {
			head = tail = n;
		}
		else {
			tail.setNext(n);
			tail = n;

		}
		this.len ++;
	}

	public void stampa() {
		Nodo temp;
		temp = head;
		while(temp != null) {
			System.out.println("Chiave: " + temp.getKey() + " Valore: " + temp.getValue());
			temp = temp.getNext();
		}
		// System.out.println("La lista è di: " + this.len);
	}
	public int getLen() {
		return this.len;
	}
}
