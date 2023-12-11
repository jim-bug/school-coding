package it.java.AlberoBinario;

public class AlberoBinarioRicerca {
	private Nodo root = null;
	
	public void push(int info) {
		Nodo n = new Nodo(info);
		
		if (root == null) {
			root = n;
		}
		else {
			Nodo temp;
			if(info < root.getInfo()) {
				if(root.getFirstLink() == null) { // se il primo figlio della root non esiste lo creo
					root.setFirstLink(n);
				}
				else {
					temp = root.getFirstLink();
					while(info < temp.getInfo() && temp.getFirstLink() != null) {
						temp = temp.getFirstLink();
					}
					while(info > temp.getInfo() && temp.getSecondoLink() != null) {
						temp = temp.getSecondoLink();
					}
					if(info > temp.getInfo()) {
						temp.setSecondoLink(n);
					}
					else {
						temp.setFirstLink(n);
					}
				}
			}
			else {
					if(root.getSecondoLink() == null) {	// se il secondo figlio della root non esiste lo creo
						root.setSecondoLink(n);
					}
					else {
						temp = root.getSecondoLink();
						while(info < temp.getInfo() && temp.getFirstLink() != null) {
							temp = temp.getFirstLink();
						}
						while(info > temp.getInfo() && temp.getSecondoLink() != null) {
							temp = temp.getSecondoLink();
						}
						if(info > temp.getInfo()) {
							temp.setSecondoLink(n);
						}
						else {
							temp.setFirstLink(n);
						}
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
}
