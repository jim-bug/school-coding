package it.java.AlberoBinario;

public class AlberoBinarioRicerca {
	private Nodo root;
	
	public void push(int info) {
		Nodo n = new Nodo(info);
		Nodo temp;
		if(root == null) {
			root = n;
		}
		else {
			temp = root;
			while(info != temp.getInfo()) { // esco se trovo un nodo con lo stesso valore
				if(temp.getInfo() > info) {
					if(temp.getFirstLink() == null) {
						temp.setFirstLink(n);
						
					}
					temp = temp.getFirstLink();
				}
				else {
					if(temp.getSecondoLink() == null) {
						temp.setSecondoLink(n);
					}
					temp = temp.getSecondoLink();
				}
			}
		}
		
	}
	
	public void print(Nodo p) {	// visita simmetrica di un albero, preso dal libro.
		if(p == null) {
			return;
		}
		if(p.getFirstLink() != null) {
			print(p.getFirstLink());
		}
		System.out.println(p.getInfo());
		if (p.getSecondoLink() != null) {
			print(p.getSecondoLink());
		}
	}
	
	public void print() {
		Nodo p1 = root;
		print(p1);
	}
	
	public boolean ricerca(int info) {
		Nodo temp = root;
		temp = root;
		if(temp == null) {
			return false;
		}
		else {
			while(info != temp.getInfo()) { // esco se trovo un nodo con lo stesso valore
				if(temp.getInfo() == info) {
					return true;
				}
				if(temp.getInfo() > info) {
					if(temp.getFirstLink() == null) {
						return false;
					}
					temp = temp.getFirstLink();
				}
				else {
					if(temp.getSecondoLink() == null) {
						return false;
					}
					temp = temp.getSecondoLink();
				}
			}
		}
		return true;
	}
}
