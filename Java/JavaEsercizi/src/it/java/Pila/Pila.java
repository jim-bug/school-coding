package it.java.Pila;

public class Pila {
	private Nodo head = null;
	private int len = 0;
	
	public void push(String val) {
		Nodo nodo = new Nodo(val);
		Nodo temp;
		if(head == null) {
			head = nodo;
		}
		else {
			temp = head;
			head = nodo;
			head.setNext(temp);
		}
		this.len ++;
	}
	
	public void pop() {
		System.out.println("Elemento in testa: " + head.getValore());
		head = head.getNext();
	}
}
