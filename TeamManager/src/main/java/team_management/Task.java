package team_management;

public class Task {

    private int taskID;
    private int employeeID;
    private String taskDesc;
    private String taskName;
    private int projectID;
    
	public Task(int taskID, int employeeID, String taskDesc, String taskName, int projectID) {
		super();
		this.taskID = taskID;
		this.employeeID = employeeID;
		this.taskDesc = taskDesc;
		this.taskName = taskName;
		this.projectID = projectID;
	}

	public Task(int employeeID, String taskDesc, String taskName, int projectID) {
		super();
		this.employeeID = employeeID;
		this.taskDesc = taskDesc;
		this.taskName = taskName;
		this.projectID = projectID;
	}

	public Task(int taskID, String taskDesc, String taskName) {
		super();
		this.taskID = taskID;
		this.taskDesc = taskDesc;
		this.taskName = taskName;
	}

	@Override
	public String toString() {
		return "Task [taskID=" + taskID + ", employeeID=" + employeeID + ", taskDesc=" + taskDesc + ", taskName="
				+ taskName + ", projectID=" + projectID + "]";
	}

	public int getTaskID() {
		return taskID;
	}

	public void setTaskID(int taskID) {
		this.taskID = taskID;
	}

	public int getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}

	public String getTaskDesc() {
		return taskDesc;
	}

	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public int getProjectID() {
		return projectID;
	}

	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}
	
	
 
    
    
}
