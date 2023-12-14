package it.java.AlberoBinario;
import java.util.Random;
public class Main {

	public static void main(String[] args) {
		AlberoBinarioRicerca albero = new AlberoBinarioRicerca();
		AlberoBinarioRicerca albero1 = new AlberoBinarioRicerca();
		Random rand = new Random();
		int maxNodi = 500000;
		int numeroMassimo = 99999999;
		int key = rand.nextInt(numeroMassimo);
		
		long tempoPushRand = System.currentTimeMillis();
		for (int i = 0; i < maxNodi; i++) {
			int temp = rand.nextInt(numeroMassimo);
			albero.push(temp);
		}
		long tempoPushFinalRand = System.currentTimeMillis() - tempoPushRand;
		
		System.out.println("Il tempo di push degli elementi random è di " + tempoPushFinalRand + " ms");
//		long time1 = System.currentTimeMillis();
//		albero.print();
//		long time2 = System.currentTimeMillis() - time1;
//		System.out.println("Tempo di visita: " + time2 + " ms");
		long time1 = System.currentTimeMillis();
		System.out.println("Il valore " + key + " è " + albero.ricerca(key));
		long time2 = System.currentTimeMillis() - time1;
		System.out.println("Tempo di ricerca albero: " + time2 + " ms");
		
		
		System.out.println("#############################");
		long timePush = System.currentTimeMillis();
		for (int i = 0; i < maxNodi; i++) {
			// int temp = rand.nextInt(numeroMassimo);
			albero1.push(i);
			// System.out.println(i);
		}
		long timePushFinal = System.currentTimeMillis() - timePush;
		System.out.println("Il tempo di push degli elementi è di " + timePushFinal + " ms");
//		long time3 = System.currentTimeMillis();
//		albero.print();
//		long time4 = System.currentTimeMillis() - time3;
//		System.out.println("Tempo di visita: " + time4 + " ms");
		long time3 = System.currentTimeMillis();
		System.out.println("Il valore " + key + " è " + albero1.ricerca(key));
		long time4 = System.currentTimeMillis() - time3;
		System.out.println("Tempo di ricerca: " + time4 + " ms");
	}

}
