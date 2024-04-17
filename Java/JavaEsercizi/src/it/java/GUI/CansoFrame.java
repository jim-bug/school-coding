package it.java.GUI;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class CansoFrame {
	private String[] elementi = new String[10];
	private JCheckBox casellaSpunta;
	private int index = 0;
	private JFrame aFrame;
	private GridLayout layout; 
	private Font font1;
	private JLabel label1; 
	private Font font2;
	private JLabel label2; 
	private JTextField casella; 
	private JButton bottone;
	private JLabel labelErrore; 
//	private JLabel NOSt;
	private JLabel messaggio;
	
	public CansoFrame() {
		run();
	}
	
	private void run() {
		aFrame = new JFrame("Primo frame");
		casellaSpunta = new JCheckBox("Stampa");
		messaggio = new JLabel();
		layout = new GridLayout(8, 1);
		font1 = new Font("Calibri", Font.BOLD, 25);
		label1 = new JLabel("Componenti");
		font2 = new Font("Calibri", Font.BOLD, 12);
		label2 = new JLabel("Casella di testo");
		casella = new JTextField(40);
		bottone = new JButton("Premi per continuare");
		labelErrore = new JLabel();
//		NOSt = new JLabel("Non stai stampando il contenuto dell'array");
		
		aFrame.setVisible(true);
		label1.setFont(font1);
		label2.setFont(font2);
		aFrame.setLayout(layout);
		aFrame.setSize(400, 300);
		aFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		aFrame.add(label1);
		aFrame.add(label2);	
		aFrame.add(casella);
		aFrame.add(casellaSpunta);
		aFrame.add(bottone);
		aFrame.add(labelErrore);
		aFrame.add(messaggio);

		 // adatta la finestra in modo tale da poter visualizzare tutti i componenti
		
		
		
		
		bottone.addActionListener( 
				new ActionListener(){
                    
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        if(index < 10) {
                            elementi[index] = casella.getText();
                            index ++;
                            casella.setText("");
                        }
                        else {
                            labelErrore.setText("Errore: la lista supera i 10 elementi");
                            casella.setEditable(false);
                        }
                        // aFrame.revalidate();
                    }
				});

		
		casellaSpunta.addItemListener( new ItemListener () {
			
			@Override
			public void itemStateChanged(ItemEvent i) {
				if(i.getStateChange() == ItemEvent.SELECTED) {
					
					String contArray = "";
					for(int k=0; k < 10 ; k++) {
						contArray += " " + elementi[k];
					}
					messaggio.setText(contArray);
				}
				else {
					messaggio.setText(" ");
				}
			}
			
		});
		aFrame.revalidate();
		aFrame.pack();
	}
}