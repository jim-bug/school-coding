package it.classi.ereditarieta;

public class main {
    public static void main(String[] args){
        Auto mercedes = new Auto();
        Auto audi = new Auto();
        mercedes.numeroMarce = 54;
        System.out.println(mercedes.numeroMarce);
        audi.numeroMarce = 100;
        System.out.println(mercedes.numeroMarce);

    }
}
