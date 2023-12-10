package it.java.AlberoBinario;

public class Nodo{
	private int info;
	private Nodo firstLink = null;
	private Nodo secondoLink = null;
	
	public Nodo(int info) {
		this.info = info;
	}
	
	public void setFirstLink(Nodo firstLink) {
		this.firstLink = firstLink;
	}
	
	public Nodo getFirstLink() {
		return this.firstLink;
	}

	public Nodo getSecondoLink() {
		return secondoLink;
	}

	public void setSecondoLink(Nodo secondoLink) {
		this.secondoLink = secondoLink;
	}

	public int getInfo() {
		return info;
	}

	public void setInfo(int info) {
		this.info = info;
	}
}