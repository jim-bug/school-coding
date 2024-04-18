package it.java.CompitoAprile;
/*
 * Autore: Ignazio Leonardo Calogero Sperandeo
 * Data: 17/04/2024
 * Consegna: foto presente su classroom.											
 * */
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;


public class Esercizio1 extends JFrame{
	private JLabel base;
	private JLabel altezza;
	private JLabel risultato;
	private JTextField baseInput;
	private JTextField altezzaInput;
	private JTextField risultatoOutput;
	private JButton calcola;
	private JButton cancella;
	private Font font;
	
	public Esercizio1() {
		super("Frame");
		base = new JLabel("Lunghezza della base: ");
		altezza = new JLabel("Lunghezza dell'altezza: ");
		risultato = new JLabel("Misura dell'area: ");
		baseInput = new JTextField(17);
		altezzaInput = new JTextField(17);
		risultatoOutput = new JTextField(17);
		calcola = new JButton("Calcola");
		cancella = new JButton("Cancella");
		font = new Font("Arial", Font.BOLD, 13);
		run();
	}
	
	private void run() {
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(300, 300);
		setResizable(true);
		setLayout(new FlowLayout());
		setVisible(true);
		
		base.setFont(font);
		altezza.setFont(font);
		risultato.setFont(font);
		risultatoOutput.setEnabled(false);
		
		add(base);
		add(baseInput);
		add(altezza);
		add(altezzaInput);
		add(calcola);
		add(cancella);
		add(risultato);
		add(risultatoOutput);
		
		calcola.addActionListener(		// aggiungo la gestione, specifica, del bottone calcola.
				
				new ActionListener() {
					@Override
					public void actionPerformed(ActionEvent e) {
						try {
							Double base = new Double(baseInput.getText());
							Double altezza = new Double(altezzaInput.getText());
							Double area = base*altezza;
							
							risultatoOutput.setText(area.toString());
						}
						catch(Exception e1) {
							risultatoOutput.setText("NULL");
						}
						revalidate();
						
					}
		});
		
		cancella.addActionListener(
				
				new ActionListener() {
					
					@Override
					public void actionPerformed(ActionEvent e) {
						baseInput.setText("");
						altezzaInput.setText("");
						risultatoOutput.setText("");
						revalidate();
					}
		});
		
		pack();
		
	}
}
