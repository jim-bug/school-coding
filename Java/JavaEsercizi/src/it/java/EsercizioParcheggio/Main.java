package it.java.EsercizioParcheggio;

public class Main {

	public static void main(String[] args) {
		Auto[] macchine = new Auto[5];
		Parcheggio viaRossi = new Parcheggio();
		macchine[0] = new Auto("Audi", "R8", "45J 55");
		
		viaRossi.assegnaPosto(macchine[0]);
		System.out.println(viaRossi.toString());
		System.out.println(viaRossi.calcolaPrezzo(macchine[0]));
		

	}

}
