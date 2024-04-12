package it.java.GUI;

import java.awt.GridLayout;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;


public class SperandeoFrame2 extends JFrame{
	private JTextField input;
	private JComboBox elencoFont;
	private Font selectedFont;
	private JLabel label = new JLabel("");
	
	public SperandeoFrame2(){
		super("Sperandeo Frame 2");
		run();
	}
	
	private void run() {
		GridLayout layout = new GridLayout(4, 1, 10, 5);
		String[] font = {"SANS_SERIF", "MONOSPACED", "ROMAN_BASELINE"};
		elencoFont = new JComboBox(font);
		input = new JTextField(17);
		JButton button = new JButton("Confirm Font");
		
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(150, 300);
		setResizable(true);
		setLayout(layout);
		setVisible(true);
		add(input);
		add(elencoFont);
		add(button);
	
		
		elencoFont.addItemListener(new ItemListener() {		// se ho scelto qualcosa dalla combo box istanzio un oggetto Font con il font corrispondente alla combo box.
				
				@Override
				public void itemStateChanged(ItemEvent e) {
						selectedFont = new Font((String) elencoFont.getSelectedItem(), 1, 12);
				}
		});
		
		button.addActionListener( new ActionListener() {	// se clicco il bottone, modifico la label con il contenuto della text field e applico il font scelto.
			
			@Override
			public void actionPerformed(ActionEvent e) {
					label.setText(input.getText());
					label.setFont(selectedFont);
					add(label);
					revalidate();
			}
			
		});
		pack();
		
	}
}
