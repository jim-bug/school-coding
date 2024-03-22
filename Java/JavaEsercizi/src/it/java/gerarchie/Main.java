package it.java.gerarchie;
/*
 * Autore: Ignazio Leonardo Calogero Sperandeo
 * Data: 22/03/2024
 * Consegna: Creare una gerarchia di classi che preveda: una classe astratta Veicolo, due implementazioni pratiche, VeicoloTerrestre e VeicoloAcquatico. 
 * Implementare una classe Moto, una classe Barca e una classe Hovercraft (sono delle sottoclassi da collocare opportunamente), 
 * che utilizzi un'interfaccia (Terrestre o Acquatico).
 * 
 * NOTE: Hovercraft implementa l'interfaccia Acquatico, quindi sulla base della consegna la classe Hovercraft è sottoclasse della classe VeicoloTerrestre.
 * */
public class Main {

	public static void main(String[] args) {
		VeicoloTerrestre veicoloTerrestre = new VeicoloTerrestre();
		VeicoloAcquatico veicoloAcquatico = new VeicoloAcquatico();
		Moto moto = new Moto();
		Barca barca = new Barca();
		Hovercraft hovercraft = new Hovercraft();
		
		veicoloTerrestre.accendiVeicolo();
		veicoloTerrestre.spegniVeicolo();
		veicoloTerrestre.spostaVeicolo();
		
		veicoloAcquatico.accendiVeicolo();
		veicoloAcquatico.spegniVeicolo();
		veicoloAcquatico.spostaVeicolo();
		
		moto.accendiVeicolo();
		moto.spegniVeicolo();
		moto.spegniVeicolo();
		
		barca.accendiVeicolo();
		barca.spegniVeicolo();
		barca.spostaVeicolo();
		
		hovercraft.accendiVeicolo();
		hovercraft.spegniVeicolo();
		hovercraft.spostaVeicolo();
		
		
		System.out.println("####################################################");
		System.out.println(veicoloTerrestre.toString());
		System.out.println(veicoloAcquatico.toString());
		System.out.println(moto.toString());
		System.out.println(barca.toString());
		System.out.println(hovercraft.toString());
	}

}
