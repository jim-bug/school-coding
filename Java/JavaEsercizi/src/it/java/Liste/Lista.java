//package it.java.Liste;
//
//public class Lista {
//	private Nodo head;
//	private Nodo tail;
//	public int len;
//	
//	public void inserisci(String str) {
//		Nodo n = new Nodo(str);
//		Nodo temp, next;
//		
//		if(head == null) {
//			head = n;
//			tail = n;
//		}
//		else {
//			tail.setNext(n);
//			// System.out.println(tail.getNext().getValore());
//			tail = n;
//			// System.out.println(head.getValore() + " " + head.getNext().getValore());
//		}
//	}
//	public void stampa() {
//		Nodo temp;
//		temp = head; // ciao
//		while(temp != null) {
//			System.out.println(temp.getValore());
//			temp = temp.getNext();
//			len ++;
//		}
//	}
//	
//}
