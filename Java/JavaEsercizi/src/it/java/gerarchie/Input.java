package it.java.gerarchie;
import java.util.Scanner;

public final class Input {	
	public static int getIntInput(String message) {
		Scanner input = new Scanner(System.in);
		int value;
		System.out.println(message);
		while(!input.hasNextInt()) {
			System.out.println("RIPROVA :(: " + message);
			input.next();
		}
		value = input.nextInt();
		// input.close();
		return value;
	}
	
	public static float getFloatInput(String message) {
		Scanner input = new Scanner(System.in);
		float value;
		System.out.println(message);
		while(!input.hasNextFloat()) {
			System.out.println("RIPROVA :( " + message);
			input.next();
		}
		value = input.nextFloat();
		// input.close();
		return value;
	}
	
	public static String getStrInput(String message) {
		Scanner input = new Scanner(System.in);
		String value;
		System.out.println(message);
		value = input.nextLine();
		// input.close();
		return value;
	}
	
	public static boolean getBoolInput(String message) {
		Scanner input = new Scanner(System.in);
		boolean value;
		System.out.println(message);
		while(!input.hasNextBoolean()) {
			System.out.println("RIPROVA :(: " + message);
			input.next();
		}
		value = input.nextBoolean();
		// input.close();
		return value;
	}
}
