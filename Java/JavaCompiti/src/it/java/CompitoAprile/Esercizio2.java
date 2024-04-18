package it.java.CompitoAprile;


import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Esercizio2 extends JFrame{
	private JLabel name;
	private JLabel resultTotal;
	private JTextField firstNumber;
	private JTextField secondNumber;
	private JComboBox options;
	private JButton done;
	private Font font;
	private String[] nameOptions = {"ADD", "SUB", "MUL", "DIV"};
	
	public Esercizio2() {
		super("Frame");
		name = new JLabel("CALCULATOR");
		resultTotal = new JLabel("");
		firstNumber = new JTextField(17);
		secondNumber = new JTextField(17);
		options = new JComboBox(nameOptions);
		done = new JButton(" SELECT ");
		font = new Font("Arial", Font.BOLD, 13);
		
		 run();
	}
	
	private void run() {
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(300, 300);
		setResizable(true);
		setLayout(new GridLayout(4, 2, 30, 30));
		setVisible(true);
		
		name.setFont(font);
		options.setEditable(false);
		
		add(name);
		add(new JLabel(""));
		add(firstNumber);
		add(secondNumber);
		add(options);
		add(done);
		add(new JLabel(""));
		add(resultTotal);
		
		options.addItemListener(
				
				new ItemListener() {
					
					@Override
					public void itemStateChanged(ItemEvent e) {
						String option = (String)(
								(JComboBox) e.getSource()).getSelectedItem();
						done.setText(option);
						revalidate();
					}
					
		});
		
		done.addActionListener(
				
				new ActionListener() {
					
					@Override
					public void actionPerformed(ActionEvent e) {
						try {
							Double num1 = new Double(firstNumber.getText());
							Double num2 = new Double(secondNumber.getText());
							Double result = 0.0;
							
							if(done.getText().equalsIgnoreCase("ADD")) {
								result = num1 + num2;
							}
							else if (done.getText().equalsIgnoreCase("SUB")) {
								result = num1 - num2;
							}
							else if (done.getText().equalsIgnoreCase("MUL")) {
								result = num1 * num2;
							}
							else if (done.getText().equalsIgnoreCase("DIV")) {
								if(num2 != 0) {
									result = num1/num2;
								}
								else {
									throw new Exception();		// sollevo un eccezione, quindi il flusso del programma andrà direttamente nel catch
								}
								// result = num1/num2;
								
							}
							resultTotal.setText(result.toString());
							
						}
						catch(Exception e1) {
							resultTotal.setText("NULL");
						}
						
						revalidate();
					}
				});
		pack();
		
	}

}
