package team_management;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class HashTest {

	@Test
	void test() {
		String stringSalt = "[B@3d646c37";
		byte[] salt = stringSalt.getBytes();
		String hash="99af81594b1c4a4107d1f0f6c4e1f9effe05354117ff674a511e0aaa2a349665";
		
		
		String passwordTest = "password";
		assertTrue(hash.equals(Hash.hashPassword(salt, passwordTest)));
		
		
		
	}

}
