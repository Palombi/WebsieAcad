package team_management;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class Hash {
	
	public static byte[] generateSalt() {
			SecureRandom random = new SecureRandom();
			byte[] salt = new byte[16];
			random.nextBytes(salt);
			
			return salt;
			
	}
	
	public static String hashPassword(byte[] salt, String password) {
		StringBuilder sb = new StringBuilder();
		MessageDigest md;
		
		try {
			//Select the message digest for the has computation SHA-256
			md = MessageDigest.getInstance("SHA-256");		
			
			//passing the salt to the digest for the computation
			md.update(salt);
			
			//generate the salted hash
			byte[] hashedPassword = md.digest(password.getBytes(StandardCharsets.UTF_8));
			
			sb = new StringBuilder();
			for (byte b : hashedPassword) {
				sb.append(String.format("%02x", b));
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	//Testing purposes
//	public static void main(String[] args) {
//		String hashPassword = Hash.hashPassword("[B@3d646c37".getBytes(), "password");
//		
//		System.out.println(hashPassword);
//	}
}
