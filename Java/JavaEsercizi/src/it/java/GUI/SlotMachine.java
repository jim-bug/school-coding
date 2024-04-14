package it.java.GUI;

import javax.swing.*;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SlotMachine extends JFrame implements ActionListener {

    
    JTextField num1, num2, num3;
    JButton gioca;
    JLabel lMonete, lTenativi;
    Font font = new Font("Serif", Font.PLAIN, 50);

    int monete = 100;
    int tentativi = 0;

    SlotMachine() {
        super("SlotMachine");

        num1 = new JTextField();
        num1.setBounds(30, 30, 60, 60);
        num1.setFont(font);
        num1.setHorizontalAlignment(JTextField.CENTER);
        num1.setEditable(false);

        num2 = new JTextField();
        num2.setBounds(90, 30, 60, 60);
        num2.setFont(font);
        num2.setHorizontalAlignment(JTextField.CENTER);
        num2.setEditable(false);

        num3 = new JTextField();
        num3.setBounds(150, 30, 60, 60);
        num3.setFont(font);
        num3.setHorizontalAlignment(JTextField.CENTER);
        num3.setEditable(false);

        gioca = new JButton("GIOCA");
        gioca.setBounds(30, 100, 180, 40);
        gioca.addActionListener(this);

        lMonete = new JLabel("Monete " +  monete);
        lMonete.setBounds(30, 150, 250, 20);

        lTenativi = new JLabel("Tentativi " + tentativi);
        lTenativi.setBounds(30, 170, 250, 20);

        add(num1);
        add(num2);
        add(num3);
        add(gioca);
        add(lMonete);
        add(lTenativi);

        setSize(250, 250);
        setLayout(null);
        setVisible(true);
        setResizable(false);
    }

    public void actionPerformed(ActionEvent e) {
        int ran1 = (int) (Math.random() * 20) + 1;
        int ran2 = (int) (Math.random() * 20) + 1;
        int ran3 = (int) (Math.random() * 20) + 1;

        num1.setText(String.valueOf(ran1));
        num2.setText(String.valueOf(ran2));
        num3.setText(String.valueOf(ran3));

        if (ran1 == ran2 || ran2 == ran3 || ran1 == ran3) {
            monete += 3;
            tentativi++;
            lMonete.setText("Monete " +  monete);
            lTenativi.setText("Tentativi " + tentativi);
        } else if (ran1 == ran2 && ran2 == ran3) {
            monete += 100;
            tentativi++;
            lMonete.setText("Monete " +  monete);
            lTenativi.setText("Tentativi " + tentativi);
            gioca.setText("JACKPOT");
            gioca.setEnabled(false);
        } else {
            tentativi++;
            monete -= 1;
            lMonete.setText("Monete " +  monete);
            lTenativi.setText("Tentativi " + tentativi);
        }

        if (monete <= 0) {
            lMonete.setText("Monete " +  monete);
            lTenativi.setText("Tentativi " + tentativi);
            gioca.setText("GAME OVER");
            gioca.setEnabled(false);
        }
    }

    public static void main(String[] args) {
        new SlotMachine();
    }

}