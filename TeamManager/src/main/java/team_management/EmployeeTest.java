package team_management;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class EmployeeTest {

	@Test
	void test() {
		String firstName = "Andrea";
		String lastName = "Palombi";
		String stringSalt = "[B@3d646c37";
		byte[] salt = stringSalt.getBytes();
		String hash="99af81594b1c4a4107d1f0f6c4e1f9effe05354117ff674a511e0aaa2a349665";
		String gender = "M";
		String email = "andreapalombi95@gmail.com";

		
		
		Employee theEmployee = new Employee(firstName, lastName, hash, gender, email, salt);
		
		assertEquals(theEmployee.toString(),"Andrea Palombi");
		
		
	}

}
