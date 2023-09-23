package it.classi.ereditarieta;
public class Veicolo{
    static int numeroMarce = 0;
    int numeroRuote = 0;
    String coloreVeicolo = "Da definire";
    int numeroCavalli = 0;
    int cilindrata = 0;
    String tipoCarburante = "Da definire";
    int numeroSpecchietti = 0;
    float velocitaMassima = 0.0f;
    int numeroPosti = 0;
    String tipoDiCambio = "Da definire";

    public String accendiVeicolo(){
        return "Veicolo Acceso!";
    }
    public String spegniVeicolo(){
        return "Veicolo Spento!";
    }
    public String accelera(float accelerazione){
        return "Il veicolo ha accellerato di " + accelerazione + "m/s^2";
    }
    public String decelera(float decelerazione){
        return "Il veicolo ha accellerato di -" + decelerazione + "m/s^2";
    }
    public String frena(){
        return "Veicolo fermo!";
    }
}