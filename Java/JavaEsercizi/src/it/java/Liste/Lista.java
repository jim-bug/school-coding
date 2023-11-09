package it.java.Liste;

public class Lista {
	private Nodo head;
	private Nodo tail;
	
	public void inserisci(String str) {
		Nodo n = new Nodo(str);
		Nodo temp, next;
		boolean inserito;
		
		if(head == null) {
			head = tail = n;
		}
		else {
			if (str.compareTo(head.getValore()) < 0) {
				n.setNext(head);
				head = n;
			}
			else {
				inserito = false;
				temp = head;
				next = head.getNext();
				while(next != null) {
					if(str.compareTo(next.getValore()) < 0) {
						temp.setNext(n);
						n.setNext(next);
						inserito = true;
						break;
					}
					temp = next;
					next = next.getNext();
					if(! inserito) {
						tail.setNext(n);
						tail = n;
					}
				}
			}
		}
	}
	
}
