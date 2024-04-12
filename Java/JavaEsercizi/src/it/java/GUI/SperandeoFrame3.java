package it.java.GUI;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;

public class SperandeoFrame3 extends JFrame{
	private ArrayList<String> elementiTextField;
	private String elementoCheckBox;
	private JTextField input;
	private JCheckBox boxLista;
	private JButton bottone;
	private JLabel labelErrore;
	private JLabel labelLista;
	private GridLayout layout;
	
	public SperandeoFrame3() {
		super("SperandeoFrame3");
		labelErrore = new JLabel("");
		labelLista = new JLabel("");
		layout = new GridLayout(3, 3);
		run();
	}
	

	private void run() {
		input = new JTextField(17);
		boxLista = new JCheckBox("Stampa");
		bottone = new JButton("Aggiungi alla lista");
		elementiTextField = new ArrayList<String>();
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(300, 300);
		setResizable(true);
		setVisible(true);
		setLayout(layout);
		
		add(input);
		add(bottone);
		add(boxLista);
		add(labelErrore);
		add(labelLista);
		
		
		bottone.addActionListener(
				new ActionListener() {
					
					@Override
					public void actionPerformed(ActionEvent e) {
						if(elementiTextField.size() < 10) {
							elementiTextField.add(input.getText());
							input.setText("");
						}
						else {
							input.setText("");
							input.setEditable(false);
							labelErrore.setText("LUNGHEZZA SUPERATA");
						}
						
						revalidate();
					}
					
				}
		);
		
		boxLista.addItemListener(
				new ItemListener() {
					
					@Override
					public void itemStateChanged(ItemEvent e) {
						if(e.getStateChange() == ItemEvent.SELECTED && elementiTextField.size() > 0) {
							String contenutoLabel = "";
							for(String i : elementiTextField) {
								contenutoLabel += " " + i;
							}
							labelLista.setText(contenutoLabel);
						}
						
						revalidate();
					}
					
				}
		);
		pack();
	}
	
}
