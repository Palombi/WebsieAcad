package team_management;

import java.util.Date;

public class Project {

    private int projectID;
    private String projectName;
    private Date startDate;
    private Date endDate;
    private int clientID;
    
	public Project(int projectID, String projectName, Date startDate, Date endDate, int clientID) {
		super();
		this.projectID = projectID;
		this.projectName = projectName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.clientID = clientID;
	}
	
	
	public Project(String projectName, Date startDate, Date endDate, int clientID) {
		super();
		this.projectName = projectName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.clientID = clientID;
	}


	public Project() {
		super();
	}
	public int getProjectID() {
		return projectID;
	}
	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getClientID() {
		return clientID;
	}
	public void setClientID(int clientID) {
		this.clientID = clientID;
	}
	@Override
	public String toString() {
		return "Project [projectID=" + projectID + ", projectName=" + projectName + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", clientID=" + clientID + "]";
	}
   
    
   
}

