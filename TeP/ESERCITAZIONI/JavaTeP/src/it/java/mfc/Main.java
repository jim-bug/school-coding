package it.java.mfc;

public class Main {
	public static void main(String[] args) {
		if(args.length == 0 || args[0].equalsIgnoreCase("-h") || args[0].equalsIgnoreCase("--help")) {
		    System.out.println("USO:\n\tjava Main {options} {args}");
	        System.out.println("DESCRIPTION:");
	        System.out.println("\tPermette di connettersi ad un socket già aperto o di creare un socket in ascolto su una porta.");
	        System.out.println("OPTIONS:");
	        System.out.println("\t-h, --help\t\tMostra il manuale");
	        System.out.println("\t-c, --connect IP PORT\tSpecifica l'IPv4 di un server e il suo numero di porta per connettersi.");
	        System.out.println("\t-s, --server PORT\tSpecifica il numero di porta su cui dovrà ascoltare il processo.");
		}
		else if(args[0].equalsIgnoreCase("-s")) {
			if(args.length < 2) {
				System.out.println("Specificare il numero di porta su cui il server starà in ascolto.");
			}
			else {
				new Server(Short.parseShort(args[1]));		// classe wrapper
			}
		}
		else if(args[0].equalsIgnoreCase("-c")){
			if(args.length < 3) {
				System.out.println("Specificare l'indirizzo IPv4 del server e il suo numero di porta su cui il client dovrà connettersi.");
			}
			else {
				new Client(args[1], Short.parseShort(args[3]));
			}
		}
		else {
			System.out.println("Opzioni non valide, usa -h o --help");
		}

	}

}
// :)