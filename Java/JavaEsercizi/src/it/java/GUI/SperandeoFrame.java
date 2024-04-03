package it.java.GUI;

import javax.swing.*;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Font.*;
import java.awt.event.*;


public class SperandeoFrame extends JFrame implements ActionListener{
	final int LUNGHEZZA = 100;
	final int LARGHEZZA = 250;
	private JTextField casellaInput;
	private String[] arrayElementi = new String[10];
	private int indexArray = 0;
	
	public SperandeoFrame() {
		super("SperandeoFrame");
		this.inizialize();
	}
	
	public void inizialize() {
		Font fontLabel1 = new Font("Calibri", Font.BOLD, 15);
		Font fontLabel2 = new Font("Calibri", Font.ITALIC, 10);
		JLabel label1 = new JLabel("Complimenti");
		JLabel label2 = new JLabel("Casella di testo");
		casellaInput = new JTextField(17);
		JButton bottone = new JButton("Premi per continuare");
		FlowLayout layout = new FlowLayout(FlowLayout.CENTER);
		label1.setFont(fontLabel1);
		label2.setFont(fontLabel2);
		setSize(this.LUNGHEZZA, this.LARGHEZZA);
		setResizable(true);
		setLayout(layout);
		setVisible(true);
		add(label1);
		add(label2);
		add(casellaInput);
		add(bottone);
		bottone.addActionListener(this);
		setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(indexArray == 10) {
			JLabel errore = new JLabel("ERRORE, LUNGHEZZ ARRAY SUPERATA");
			add(errore);
			casellaInput.setEditable(false);
			casellaInput.setText("");
		}
		arrayElementi[indexArray] = casellaInput.getText();
		indexArray ++;
		casellaInput.setText("");
	}

}
