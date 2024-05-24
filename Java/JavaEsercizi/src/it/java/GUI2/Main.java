package it.java.GUI2;


import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Main {

	public static void main(String[] args) {
		JFrame frame = new JFrame("Finestra Alex");
		FlowLayout layout = new FlowLayout(FlowLayout.CENTER);
		JLabel label = new JLabel("CIAO");
		JButton bottone = new JButton("Bottone");
		JTextField input = new JTextField(17);
		// input.setEditable(false);		// blocco la textfield
		String[] elenco = {"Ciao", "Come", "Stai"};
//		String[] elenco1 = new String[10];
//		elenco1[0] = "Come va";
		JComboBox box = new JComboBox(elenco);
		JCheckBox boxs = new JCheckBox("Java");
		// boxs.setSelected(true);
		
		
		
		
		frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		frame.setSize(300, 300);
		frame.setResizable(true);
		frame.setVisible(true);		// rendo la finestra visibile all'utente
		frame.setLayout(layout);
		
		frame.add(label);
		frame.add(bottone);
		frame.add(input);
		frame.add(box);
		frame.add(boxs);
		
		
		bottone.addActionListener(
				
				new ActionListener() {
					@Override
					public void actionPerformed(ActionEvent e) {
						label.setText("Cliccato");
						
						frame.revalidate();
					}
		});
		
		
		box.addItemListener(
				
				new ItemListener() {
					
					@Override
					
					public void itemStateChanged(ItemEvent e) {
						JComboBox boxLocal = (JComboBox) e.getSource();
						String testo = (String) boxLocal.getSelectedItem();
						
						label.setText(testo);
						
						frame.revalidate();
					}
				}
				
		);
		
		// frame.pack();
		
		

	}

}
