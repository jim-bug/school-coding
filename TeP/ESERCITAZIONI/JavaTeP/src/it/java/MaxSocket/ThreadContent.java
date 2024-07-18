package it.java.MaxSocket;

import java.net.Socket;
import java.util.ArrayList;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;


public class ThreadContent extends Thread{
	private Socket client;
	private ArrayList<Integer> numbersClient;
	private Integer max;
	
	public ThreadContent(Socket client) {
		setClient(client);
		this.start();
	}

	public void run() {
		try {
			System.out.println("Thread creato.");
			BufferedReader readStream = new BufferedReader(new InputStreamReader(client.getInputStream()));
			PrintWriter writeStream = new PrintWriter(client.getOutputStream(), true);
			String line = "";
			while((line = readStream.readLine()) != null) {
				Integer temp = Integer.parseInt(line);
				System.out.println(line);
				if(temp < 0) {
					this.max = 0;
					writeStream.println("Massimo rinizializzato a 0");
					// numbersClient.clear();
				}
				else {
					numbersClient.add(temp);
					this.maxSequence(numbersClient);
					writeStream.println("Massimo sequenza fino ad ora: " + this.max);
				}

			}
			
		} catch(Exception e) {
			
		}

	}
	
	public Socket getClient() {
		return client;
	}

	public void setClient(Socket client) {
		this.client = client;
	}

	public ArrayList<Integer> getNumbersClient() {
		return numbersClient;
	}

	public void setNumbersClient(ArrayList<Integer> numbersClient) {
		this.numbersClient = numbersClient;
	}

	public Integer getMax() {
		return max;
	}

	public void setMax(Integer max) {
		this.max = max;
	}
	
	private void maxSequence(ArrayList<Integer> lista) {
		this.max = lista.get(0);
		for(Integer i : lista) {
			if(i > max) {
				max = i;
			}
		}
	}
	
	
}
