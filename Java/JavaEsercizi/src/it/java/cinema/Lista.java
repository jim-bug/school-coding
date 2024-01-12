package it.java.cinema;

public class Lista {
	private Nodo head;
	private Nodo tail;
	private int len;
	
	public void inserisci(String val) {
		Nodo n = new Nodo(val);
		Nodo temp, next;
		
		if(head == null) {
			head = tail = n;
		}
		else {
			tail.setNext(n);
			tail = n;

		}
		this.len ++;
	}
	public void inserisci(String val, int pos) {
		Nodo n = new Nodo(val);
		Nodo temp, next;
		if(pos > this.len) {
			tail.setNext(n);
			tail = n;
		}
		temp = head;
		next = head.getNext();
		for(int i = 0;i < (pos-1);i++) {
			temp = next;
			next = next.getNext();
		}
		temp.setNext(n);
		n.setNext(next);
		this.len ++;
	}
	public void stampa() {
		Nodo temp;
		temp = head;
		while(temp != null) {
			System.out.println(temp.getValore());
			temp = temp.getNext();
		}
		System.out.println("La lista è di: " + this.len);
	}
	
	public void stampa(int pos) {
		Nodo temp = head;
		if(pos == this.len - 1) {
			System.out.println("L'elemento alla posizione " + pos + " è: " + tail.getValore());
		}
		for(int i = 0;i < pos;i++){
			temp = temp.getNext();
		}
		System.out.println("L'elemento alla posizione " + pos + " è: " + temp.getValore());
	}
	
	public int getLen() {
		return this.len;
	}
}
