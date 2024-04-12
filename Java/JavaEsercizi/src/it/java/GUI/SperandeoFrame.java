package it.java.GUI;

import javax.swing.*;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Font.*;
import java.awt.event.*;
import java.util.ArrayList;

public class SperandeoFrame extends JFrame implements ActionListener{
	final int maxLength = 10;
	private JTextField casellaInput;
	private ArrayList<String> elementiCasellaInput;
	private FlowLayout layout;
	
	public SperandeoFrame() {
		super("SperandeoFrame");
		this.inizialize();
	}
	
	public void inizialize() {
		Font fontLabel1 = new Font("Arial", Font.BOLD, 15);
		Font fontLabel2 = new Font("Arial", Font.ITALIC, 10);
		JLabel label1 = new JLabel("Complimenti");
		JLabel label2 = new JLabel("Casella di testo");
		casellaInput = new JTextField(17);
		elementiCasellaInput = new ArrayList<String>();
		JButton bottone = new JButton("Premi per continuare");
		layout = new FlowLayout(FlowLayout.CENTER);		// layout manager usato per questo frame.
		setSize(250, 100);
		setLayout(layout);
		setVisible(true);
		setResizable(true);
		// Ai due label imposto due font diversi
		label1.setFont(fontLabel1);
		label2.setFont(fontLabel2);
		// Aggiungo i Componenti al frame
		add(label1);
		add(label2);
		add(casellaInput);
		add(bottone);
		// Aggungo un listener al bottone, non appena si scatena l'evento (click del bottone), si eseguirà il metodo .actionPerformed()
		bottone.addActionListener(this);
		// Appena il frame verrà chiuso, chiudo l'applicazione.
		setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(elementiCasellaInput.size() == maxLength) {
			// layout = new FlowLayout(FlowLayout.LEFT);
			JLabel errore = new JLabel("ERRORE, LUNGHEZZA ARRAY SUPERATA");
			// setLayout(layout);
			add(errore);
			for(String i : elementiCasellaInput) {
				JLabel val = new JLabel(i);
				add(val);
			}
			casellaInput.setEditable(false);		// disabilito la scrittura sulla TextField
			casellaInput.setText("");
		}
		else {
			elementiCasellaInput.add(casellaInput.getText());
			casellaInput.setText("");
		}
		revalidate();	// aggiorno il layout manager alle modifiche dinamiche (dipendenti dallo scatenarsi di un evento) in modo tale fa far adattare il frame alle nuove modifiche.
	}

}
