package it.java.test;
import java.util.Scanner; //riga per importare classe scanner
public class Main{
	public static void main(String[] args) {
		int numeroRuote = -1;
		int numeroFari = 0;
		String cilindrata = "";
		int posti = 0;
		int specchietti = 0;
		String colore = "";
		String tipoMotore = "";
		float velocitàMax = 0;
		String tipoCarburante = "";
		int marcia = 0;
		boolean accensioneVeic = true;
		Veicolo v = new Veicolo(numeroRuote, numeroFari, cilindrata, posti, specchietti, colore, tipoMotore, velocitàMax, tipoCarburante, marcia, accensioneVeic);
		
//  
//		
//			System.out.println("numero ruote: " + v.getNumeroRuote());
//			//v.getNumeroRuote = 4;
//			System.out.println("numero fari: " + v.getNumeroFari());
//			//v.getNumeroFari = 4;
//			System.out.println("cilindrata: " + v.getCilindrata());
//			//v.getCilindrata = "1300 cc";
//			System.out.println("numero posti: " + v.getPosti());
//			//v.getPosti = 4;
//			System.out.println("numero specchietti: " + v.getSpecchietti());
//			//v.getSpecchietti = 3;
//			System.out.println("colore carrozzeria: " + v.getColore());
//			//v.getColore = "Nero Etna";
//			System.out.println("tipo motore: " + v.getTipoMotore());
//			//v.getTipoMotore = "Quadricilindrico";
//			System.out.println("velocità raggiungibile: " + v.getVelocitàMax());
//			//v.getVelocitàMax = 180;
//			System.out.println("tipo carburante: " + v.getTipoCarburante());
//			//v.getTipoCarburante = "Diesel";
//			
//			
//			v.marciaSu();
//			System.out.println("marcia: " + v.getMarcia());
//			v.marciaGiu();
//			System.out.println("marcia: " + v.getMarcia());
//			v.spegni();
//			v.accendi();
//			if (v.getAccensioneVeic() == true)
//				System.out.println("il veicolo adesso è acceso");
//			else
//				System.out.println("il veicolo adesso è spento");
//			
//			
//			int a = input.nextInt();
//			input.nextLine();
//			String b = input.nextLine();
//			System.out.println(a);
//			System.out.print(b);
//			//queste ultime 5 righe servono per "pulire" lo stream dall' "input.next"
			
	}

}
