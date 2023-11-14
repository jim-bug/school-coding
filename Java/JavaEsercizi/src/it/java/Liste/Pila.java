package it.java.Liste;

public class Pila {
	private Nodo head = null;
	private Nodo tail = null;
	private int len = 0;
	
	public void push(int num) {
		Nodo n = new Nodo(num);
		if(head == null) {
			head = tail = n;
		}
		else {
			tail.setNext(n);
			tail = n;
		}
		len ++;
	}
	public void pop() {
		Nodo temp;
		System.out.println(tail.getValore());
		temp = head.getNext();
		for(int i = 0; i < len-(len-1); i++) {
			if(temp != null) {
				temp = temp.getNext();
			}

		}
		tail.setNext(temp);
		tail = temp;
	}
}
