package team_management;

import java.util.ArrayList;

public class Employee {

    private int empID;
    private String firstName;
    private String lastName;
    private String passWord;
    private String hash;
    private String gender;
    private String email;
    private ArrayList<Skill> empSkill;
    private byte[] salt = new byte[16];

    public Employee(int empID, String firstName, String lastName,String passWord,String gender, String email, ArrayList<Skill> empSkill) {
        this.empID = empID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.passWord = passWord;
        this.gender = gender;
        this.email = email;
        this.empSkill = empSkill;
    }

    public Employee(int empID, String firstName, String lastName, String hash, String gender, String email) {
		super();
		this.empID = empID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.hash = hash;
		this.gender = gender;
		this.email = email;
	}
    
    public Employee(int empID, String firstName, String lastName, String hash, String gender, String email, byte[] salt) {
		super();
		this.empID = empID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.hash = hash;
		this.gender = gender;
		this.email = email;
		this.salt = salt;
	}


	public Employee(String firstName, String lastName, String passWord, String gender, String email) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.passWord = passWord;
		this.gender = gender;
		this.email = email;
	}
	
	public Employee(String firstName, String lastName, String hash, String gender, String email, byte[] salt) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.hash = hash;
		this.gender = gender;
		this.email = email;
		this.salt = salt;
	}

	public Employee() {
    }

	public Employee(int empID, String firstName, String lastName, String gender, String email) {
		super();
		this.empID = empID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.email = email;
	}

	public int getEmpID() {
        return empID;
    }

    public void setEmpID(int empID) {
        this.empID = empID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ArrayList<Skill> getEmpSkill() {
        return empSkill;
    }

    public void setEmpSkill(ArrayList<Skill> empSkill) {
        this.empSkill = empSkill;
    }

    @Override
    public String toString() {
        return firstName + " " + lastName;
    }


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPassWord() {
		return passWord;
	}


	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public byte[] getSalt() {
		return salt;
	}

	public void setSalt(byte[] salt) {
		this.salt = salt;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}
	
	
}
