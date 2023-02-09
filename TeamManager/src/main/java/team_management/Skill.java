package team_management;

public class Skill {

    private int skillID;
    private String skillName;
    private String skillCertificate;
    private String skillAgency;


    public Skill(int skillID, String skillName, String skillDescript, String skillAgency) {
        this.skillID = skillID;
        this.skillName = skillName;
        this.skillCertificate = skillDescript;
        this.skillAgency = skillAgency;
    }

    public Skill() {
    }

    public int getSkillID() {
        return skillID;
    }

    public void setSkillID(int skillID) {
        this.skillID = skillID;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getSkillDescript() {
        return skillCertificate;
    }

    public void setSkillDescript(String skillDescript) {
        this.skillCertificate = skillDescript;
    }


    @Override
    public String toString() {
        return "Skill{" +
                "skillID=" + skillID +
                ", skillName='" + skillName + '\'' +
                ", skillDescript='" + skillCertificate + '\'' +
                '}';
    }

	public String getSkillAgency() {
		return skillAgency;
	}

	public void setSkillAgency(String skillAgency) {
		this.skillAgency = skillAgency;
	}
}
