package it.java.esercizi.classi.ereditarieta;

public class Main {
    public static void main(String[] args){
    	Veicolo v = new Veicolo(4, 4, "1300 cc", 4, 3, "Verde", "", 200, "Disel");
    	System.out.println(v.getNumeroRuote());
    	System.out.println(v.getCilindrata());

    }
}