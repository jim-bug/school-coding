package it.java.EsercizioParcheggioConListe;

public class Lista {
	private Nodo head = null;
	private Nodo tail = null;
	private int len;
	
	public void inserisci(Posto val) {
		Nodo n = new Nodo(val);
		
		if(head == null) {
			head = tail = n;
		}
		else {
			tail.setNext(n);
			tail = n;

		}
		this.len ++;
	}
	public void inserisci(Posto val, int pos) {
		Nodo n = new Nodo(val);
		Nodo temp, next;
		if(pos > this.len) {	// voglio inserire in coda?
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
	
	public Posto stampa(int pos) {
		Nodo temp = head;
		if(pos == this.len - 1) {	// voglio in output la coda?
			return tail.getValore();
		}
		for(int i = 0;i < pos;i++){
			temp = temp.getNext();
		}
		return temp.getValore();
	}
	
	public int getLen() {
		return this.len;
	}
}
