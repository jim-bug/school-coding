package it.java.Code;

public class Coda {
	private Nodo head = null;
	private Nodo tail = null;
	private int len = 0;
	
	public void push(String val) {
		Nodo nodo = new Nodo(val);
		
		if(head == null) {
			head = tail = nodo;
		}
		else {
			tail.setNext(nodo);
			tail = nodo;
		}
		this.len ++;
	}
	
	public void pop() {
		System.out.println("Elemento in testa: " + head.getValore());
		head = head.getNext();
	}
}
