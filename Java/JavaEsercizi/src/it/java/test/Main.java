package it.java.test;
import java.time.LocalDate;
import java.time.DayOfWeek;
import java.util.Scanner;
import java.io.File;
public class Main {

	public static void main(String[] args) {
		try {
			int[] oreDisponibili = {8, 9, 10, 11, 12, 13};
			Scanner inputConsole = new Scanner(System.in);
			String giornoDellaSettimana = "";
			System.out.println("Inserisci il giorno da visualizzare(digitare n per usare il giorno corrente): ");
			giornoDellaSettimana = inputConsole.nextLine();
			if(giornoDellaSettimana.charAt(0) == 'n') {
				LocalDate data = LocalDate.now();
				DayOfWeek giornoDiOggi = data.getDayOfWeek();
				giornoDellaSettimana = giornoDiOggi.toString();
			}
			giornoDellaSettimana = formattaGiorno(giornoDellaSettimana);
			System.out.println("Vuoi visualizzare un ora specifica? s/n");
			if(inputConsole.nextLine().charAt(0) == 's') {
				System.out.println("Inserisci l'ora(compresa tra 8 e 13): ");
				int ora = inputConsole.nextInt();
				if (ora >= 8 && ora <= 13) {
					getOraOrario(ricercaSequenziale(oreDisponibili, ora), "C:\\Users\\Ignazio\\Desktop\\coding\\school-coding\\Java\\JavaEsercizi\\src\\it\\java\\test\\OrarioSettimanale\\"+giornoDellaSettimana+".txt");
					// System.out.println(ora+""+ricercaSequenziale(oreDisponibili, ora));
				}
				else {
					System.out.println("Ora non valida!");
				}
			}
			else {
				File myFile = new File("C:\\Users\\Ignazio\\Desktop\\coding\\school-coding\\Java\\JavaEsercizi\\src\\it\\java\\test\\OrarioSettimanale\\"+giornoDellaSettimana+".txt");
				Scanner inputFile = new Scanner(myFile);
				getOrarioGiorno(inputFile);
				inputFile.close();
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
	public static void getOrarioGiorno(Scanner input) {
		while (input.hasNextLine()) {
			System.out.println(input.nextLine());
		}
	}
	public static String formattaGiorno(String giorno) {
		String giornoFormattato = "";
		switch (giorno) {
			case "MONDAY":
				giornoFormattato = "Lunedi";
				break;
			case "TUESDAY":
				giornoFormattato = "Martedi";
				break;
			case "WEDNESDAY":
				giornoFormattato = "Mercoledi";
				break;
			case "TRHURSDAY":
				giornoFormattato = "Giovedi";
				break;
			case "FRIDAY":
				giornoFormattato = "Venerdi";
				break;
			default:
				giornoFormattato = giorno;
				break;
		}
		return giornoFormattato;
	}
	public static void getOraOrario(int posizioneOra, String path) {
		try {
			File myFile = new File(path);
			Scanner inputMyFile = new Scanner(myFile);
			inputMyFile.nextLine();
			for (int i = 0;i < posizioneOra;i++) {
				inputMyFile.nextLine();
			}
			System.out.println("L'ora è: " + inputMyFile.nextLine());
			inputMyFile.close();
		}
		catch(Exception error) {
			System.out.println("Dal metodo .getOraOrario() è stato generato un errore: ");
			System.out.println(error);
		}
	}
	public static int ricercaSequenziale(int[] array, int key) {
		for (int i = 0;i < array.length;i++) {
			if (array[i] == key) {
				return i;
			}
		}
		return -1;
	}

}