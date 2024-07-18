package it.java.MaxSocket;

public class Main {

	public static void main(String[] args) {
		if(args.length < 1) {
			return;
		}
		else if(args[0].equalsIgnoreCase("-s")) {
			new Server();
		}
		else if(args[0].equalsIgnoreCase("-c") && args.length == 3) {
			new Client(args[1], Short.parseShort(args[2]));
		}
	}

}
