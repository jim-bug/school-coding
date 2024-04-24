package it.java.jbSm;

import static org.junit.Assert.*;

import org.junit.Test;

public class BankSyncModifiedTest {

	@Test
	public void testGetAccountState() {
		double[] output = {260336.2, 485747.0, 719629.94, 958313.27,  1209838.79};
		BankSyncModified bsm;
		for(Integer i = 1; i < 5;i++) {
			bsm = new BankSyncModified(i.toString());
			System.out.println(output[i-1] + " " + bsm.getAccountState() + " " + i);
			// assertEquals(output[i], bsm.getAccountState(), 0.01);
		}
	}

}
