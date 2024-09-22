package it.java.CompitoAprile;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Frame{

	public static void main(String[] args) {
		JFrame frame = new JFrame ("Calculator");
		frame.setSize(300,400);
		frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		FlowLayout layout = new FlowLayout(FlowLayout.CENTER);
		frame.setLayout(layout);
		
		JTextField text1 = new JTextField (10);
		JTextField text2 = new JTextField (10);
		JButton button1 = new JButton ("somma");
		JButton button2 = new JButton ("cancella");
		
		JLabel label3 = new JLabel("");
		
		frame.add(new JLabel(""));
		frame.add(text1);
		frame.add(text2);
		frame.add(new JLabel(""));
		frame.add(button1);
		frame.add(button2);
		frame.add(new JLabel(""));
		frame.add(label3);
		frame.setVisible(true);
		
		button1.addActionListener(
				new ActionListener() {
					@Override
					public void actionPerformed(ActionEvent e) {
						
						Double num1 = new Double(text1.getText());
						Double num2 = new Double(text2.getText());
				
						double sum= num1 + num2;
						label3.setText("risultato: "+sum);
						
					}
				}
		);
		
		
		

	}

}
