package it.java.Pila;

public class Main {

	public static void main(String[] args) {
		Pila pila = new Pila();
		for(Integer i = 0;i < 15; i++) {
			pila.push(i.toString());
		}
		for(int i = 0;i < 15; i++) {
			pila.pop();
		}
	}

}
