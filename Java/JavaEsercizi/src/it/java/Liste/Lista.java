package it.java.Liste;

public class Lista {
	private Nodo head;
	private Nodo tail;
	private int len;
	
	public void inserisci(String val) {
		Nodo n = new Nodo(val);
		Nodo temp, next;
		boolean inserito;
		
		if(head == null) {
			head = tail = n;
		}
		else {
			if(val.compareTo(head.getValore()) < 0) {
				n.setNext(head);
				head = n;
			}
			else {
				inserito = false;
				temp = head;
				next = head.getNext();
				while (next != null) {
					if(val.compareTo(next.getValore()) < 0) {
						temp.setNext(n);
						n.setNext(next);
						inserito = true;
						break;
					}
					temp = next;
					next = next.getNext();
				}
				if(!inserito) {
					tail.setNext(n);
					tail = n;
				}
			}
		}
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
	
	public int getLen() {
		return this.len;
	}
}
