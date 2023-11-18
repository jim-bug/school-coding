package it.java.Code;

public class Main {

	public static void main(String[] args) {
		Coda coda = new Coda();
		
		for(Integer i = 0;i < 15; i++) {
			coda.push(i.toString());
		}
		for(int i = 0;i < 15;i++) {
			coda.pop();
		}

	}

}
