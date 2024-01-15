package it.java.release1;

import static org.junit.Assert.*;
import org.junit.Test;

public class RettangoloTest {


	@Test
	public void testGetArea() {
		String larghezza = "-10";
		String lunghezza = "1";
		double area = Double.parseDouble(larghezza)*Double.parseDouble(lunghezza);
		Rettangolo stanza = new Rettangolo(lunghezza, larghezza);
		assertEquals("Input non valido", area, stanza.getArea(), 0.001);
	}
	
	@Test
	public void testGetPerimetro() {
		String larghezza = "10";
		String lunghezza = "4";
		double perimetro = (Double.parseDouble(larghezza)+Double.parseDouble(lunghezza))*2;
		Rettangolo stanza = new Rettangolo(lunghezza, larghezza);
		assertEquals("Input non valido", perimetro, stanza.getPerimetro(), 0.001);
	}






}
