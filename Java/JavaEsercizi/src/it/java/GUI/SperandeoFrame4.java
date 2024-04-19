package it.java.GUI;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Random;


public class SperandeoFrame4 extends JFrame implements ActionListener{
	public static final int N_BOTTONI = 12;
	private JButton[] bottoni;
	private String[] testiBottoni;
	private JButton reset;
	private GridLayout layout;
	private JLabel testoCorrispondente;
	private String testo;
	
	public SperandeoFrame4() {
		super("SperandeFrame");
//		for(int i = 0;i < 12; i++) {
//			bottoni[i] = new JButton(testiBottoni[i]);
//		}
		
		bottoni = new JButton[N_BOTTONI];		// dichiaro 12 attributi di tipo JButton
		testiBottoni = generateTextButton(N_BOTTONI, 2);
		testo = "";
		reset = new JButton("Reset");
		layout = new GridLayout(3, 12);
		testoCorrispondente = new JLabel("");
	    run();
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		/*
		 * Gestisco un evento unico in quanto ogni bottone, tranne quello di reset, deve mostrare in una label il proprio testo.
		 * */
		if(e.getSource() == reset) {
			testoCorrispondente.setText("");
		}
		else {
		    JButton bottonePremuto = (JButton) e.getSource();
		    testo += " " + bottonePremuto.getText();
		    testoCorrispondente.setText(testo);
		}
		
		revalidate();
	}
	
	private void run() {
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(600, 200);
		setResizable(true);
		setLayout(layout);
		setVisible(true);
		
		for(int i = 0; i < N_BOTTONI; i++) {
			bottoni[i] = new JButton(testiBottoni[i]);
			add(bottoni[i]);
			bottoni[i].addActionListener(this);
		}
		reset.addActionListener(this);
		add(reset);
		add(testoCorrispondente);
		
		pack();
	}
	
	private String[] generateTextButton(int lengthButton, int length) {
		Random rand = new Random();
		String[] textButton = new String[lengthButton];
		char[] tempText = new char[length];		// uso l'array così posso manipolare più facilmente una stringa.
		int[] startRange = {65, 97};
		// spiegazione presente in README_SPERANDEOFRAME4_generateTextButton.txt
		for(int i = 0; i < lengthButton; i++) {
			for(int j = 0; j < length;j++) {
				int index = rand.nextInt(2);
//				int endRange = startRange[index] + 25;		// conoscendo l'ascii code della lettera A o a posso trovare, sommando 25, l'ascii code della Z o z.
				tempText[j] = (char) (rand.nextInt(25) + startRange[index]);
			}
			textButton[i] = new String(tempText);
		}
		return textButton;
		
	}
	


	
	

}
