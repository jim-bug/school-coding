package it.java.Eccezioni;
import java.util.ArrayList;
import java.util.Scanner;

public class Magazzino {
	private ArrayList<Camion> camionDisponibili = new ArrayList<Camion>();
	private int indexCamion = 0;
	
	private void addCamion() {
		camionDisponibili.add(new Camion());
	}
	
	public void addTrasporto() {
		Carico carico;
		addCamion();	// ogni trasporto richiede un camion, un trasporto prevede anche più di un carico.
		int numeroCarichi = getInputInt("Inserisci il numero di carichi: ");
		for(int i = 0;i < numeroCarichi; i++) {
			carico = new Carico(i);
			camionDisponibili.get(indexCamion).inserisciCarico(carico);
		}
		indexCamion ++;
	}
	
	public void getCamion() {
		for(Camion i : camionDisponibili) {
			System.out.println(i.toString());
		}
	}
	
	public void getCarichiCamion() {
		for(Camion i : camionDisponibili) {
			System.out.println(i.toString());
			for(Carico j : i.getCarichi()) {
				System.out.println(j.toString());
				System.out.println("####################");
			}
			System.out.println();
		}
	}
	
	public void parti() {
		getCarichiCamion();
		int camionScelto = getInputInt("Inserisci il camion da far partire: ");
		camionDisponibili.get(camionScelto).setStatoPartenza(true);
	}
	
	private int getInputInt(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		while(!input.hasNextInt()) {
			System.out.println(message);
			input.next();
		}
		return input.nextInt();
	}
	
	private static String getInputStr(String message) {
		Scanner input = new Scanner(System.in);
		System.out.println(message);
		return input.nextLine();
	}
}
