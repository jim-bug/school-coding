package it.java.mfc;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;


/**
 * La classe Client permette di connettersi ad un server ricevendo un messaggio di conferma da parte del server.
 * 
 * 
 * @author mfcGroup
 * @version 1.0
 * @see java.io.DataInputStream
 * @see java.io.DataOutputStream
 * @see java.net.Socket
 * @see java.net.UnknownHostException
 * @see java.io.IOException
 * 
 * */
public class Client {
	private Socket socket = null;
	private DataInputStream in = null;
	private DataOutputStream out = null;
	private String serverAddress;
	private short port; 
	
	
	/**
	 * Metodo costruttore che inizializza l'indirizzo del server a cui connettersi assieme al numero di porta.
	 * @param serverAddress - Indirizzo IPv4 del server a cui connettersi.
	 * @param port - Numero di porta del server
	 * */
	public Client(String serverAddress, short port) {
		setServerAddress(serverAddress);
		setPort(port);
		start(serverAddress, port);
	}


	/**
	 * Metodo che si occupa di connettersi al client mandando a video il messaggio che riceve.
	 * 
	 * @throws UnknownHostException
	 * @throws IOException
	 * */
	public void start(String serverAddress, short port) {
		try {
			socket = new Socket(serverAddress, port);
			System.out.println("Connessione avvenuta con successo\n");
			
			in = new DataInputStream(socket.getInputStream());
			
			out = new DataOutputStream(socket.getOutputStream());
			
			// Lettura del messaggio inviato dal server
            String messageFromServer = in.readLine();
            System.out.println("Messaggio dal server: " + messageFromServer);
			
		} catch(UnknownHostException e) {
			System.out.println("Impossibile trovare l'host");
			e.printStackTrace();
			return;
		} catch (IOException e) {
			System.out.println("Errore durante la connessione");
			e.printStackTrace();
			return;
		}
		
		
		// Chiusura della connessione
		try {
			in.close();
			out.close();
			socket.close();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("Connessione chiusa");
	}
	
	public Socket getSocket() {
		return socket;
	}

	public void setSocket(Socket socket) {
		this.socket = socket;
	}

	public DataInputStream getIn() {
		return in;
	}

	public void setIn(DataInputStream in) {
		this.in = in;
	}

	public DataOutputStream getOut() {
		return out;
	}

	public void setOut(DataOutputStream out) {
		this.out = out;
	}

	public String getServerAddress() {
		return serverAddress;
	}

	public void setServerAddress(String serverAddress) {
		this.serverAddress = serverAddress;
	}

	public short getPort() {
		return port;
	}

	public void setPort(short port) {
		this.port = port;
	}
		
}
// :)
