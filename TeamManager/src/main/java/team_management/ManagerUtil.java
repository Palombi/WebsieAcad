package team_management;

import java.io.ByteArrayInputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

public class ManagerUtil {
	
	private DataSource dataSource;

	public ManagerUtil(DataSource theDataSource) {
		dataSource= theDataSource;
	}
	
	
	public List<Task> getTasks() throws Exception {
		// TODO Auto-generated method stub
		
		List<Task> tasks = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from task order by id_Task";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id_Task");
				String taskName = myRs.getString("task_Name");
				String taskDesc = myRs.getString("task_Description");
				int employeeID = myRs.getInt("Employee_id_Employee");
				int projectID = myRs.getInt("project_id_Project");
				
				// create new task object
				Task tempTask = new Task(id, employeeID, taskDesc, taskName , projectID);
				
				// add it to the list of tasks
				tasks.add(tempTask);				
			}
			
			return tasks;
		}
			finally {
				// close JDBC objects
				close(myConn, myStmt, myRs);
			}	
		
	}

	
	public List<Employee> getEmployees() throws Exception {
		// TODO Auto-generated method stub
		
		List<Employee> employees = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from employee order by id_Employee";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id_Employee");
				String firstName = myRs.getString("first_Name");
				String lastName = myRs.getString("last_Name");
				String hash = myRs.getString("hash");
				String gender = myRs.getString("gender");
				String email = myRs.getString("email");
				byte[] salt = myRs.getBytes("salt");
				
				
				// create new student object
				Employee tempEmp = new Employee(id, firstName, lastName, hash, gender, email, salt);
				
				// add it to the list of students
				employees.add(tempEmp);				
			}
			
			return employees;		
		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}		
		
	}
	
	// chris start	
	public List<Project> getProjects() throws Exception {
		// TODO Auto-generated method stub
		
		List<Project> projects = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "SELECT * FROM team_manager_db.project";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id_Project");
				String projectName = myRs.getString("project_Name");
				Date projStartDate = myRs.getDate("proj_Start_Date");
				Date projEndDate = myRs.getDate("proj_End_Date");
				int clientIdClient = myRs.getInt("Client_id_Client");
				
				
				// create new student object
				Project tempPro = new Project(id, projectName, projStartDate, projEndDate, clientIdClient);
				
				// add it to the list of students
				projects.add(tempPro);				
			}
			
			return projects;		
		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}		
		
	}
	
	// chris end
	
	// <ALEX> Add employee to database
	public void addEmployee(Employee theEmployee) throws SQLException {
			
			
			Connection myConn = null;
			PreparedStatement myStmt = null;
			
			try {
				// get db connection
				myConn = dataSource.getConnection();		
				
				// create the sql insert
				String sql = "insert into employee "
							+ "(first_Name, last_Name, id_Manager, hash, gender, email, salt) "
							+ "values (?, ?, 8, ?, ?, ?, ?)";
				
				myStmt = myConn.prepareStatement(sql);
				
				// set the parameter values for the employee
				myStmt.setString(1, theEmployee.getFirstName());
				myStmt.setString(2, theEmployee.getLastName());
				myStmt.setString(3, theEmployee.getHash());
				myStmt.setString(4, theEmployee.getGender());
				myStmt.setString(5, theEmployee.getEmail());
				myStmt.setBytes(6, theEmployee.getSalt());
				
				// execute sql insert
				myStmt.execute();
			}
				
			finally {
				
				close(myConn, myStmt, null);
			}
			
			
		}

	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

		try {
			if (myRs != null) {
				myRs.close();
			}
			
			if (myStmt != null) {
				myStmt.close();
			}
			
			if (myConn != null) {
				myConn.close();   // doesn't really close it ... just puts back in connection pool
			}
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
	}
	
	public List<Client> getClients() throws Exception {
		// TODO Auto-generated method stub
		
		List<Client> clients = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from client order by id_Client";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id_Client");
				String clientName = myRs.getString("client_Name");
				String clientAddress = myRs.getString("client_Address");
				String clientEmail = myRs.getString("client_Email");

				// create new student object
				Client tempCli = new Client(id, clientName, clientAddress, clientEmail);
				
				// add it to the list of students
				clients.add(tempCli);				
			}
			
			return clients;		
		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}		
		
	}
	
	//matt end 

	
	public void deleteEmployee(String theEmployeeId) throws Exception{
		// TODO Auto-generated method stub
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
		
		//convert emp id to int		
		int employeeId = Integer.parseInt(theEmployeeId);
		
		//get connection to database		
		myConn = dataSource.getConnection();
		
		//create sql to delete student		
		String sql= "delete from employee_has_project where Employee_id_Employee=?;";
		
		//prepare statement		
		myStmt = myConn.prepareStatement(sql);
		
		//set param		
		myStmt.setInt(1, employeeId);
		
		//execute sql		
		myStmt.execute();
		
		sql = "delete from employee_has_skills where Employee_id_Employee=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, employeeId);
		myStmt.execute();
		
		sql = "delete from task where Employee_id_Employee=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, employeeId);
		myStmt.execute();
		
		sql = "delete from employee where id_Employee=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, employeeId);
		myStmt.execute();
		//go back to servlet
			
			
		}	
		
		finally {
		
		//close connection
			close(myConn,myStmt,null);
		
		}
		
	}

	public void updateProject(Project project) throws Exception {
		// TODO Auto-generated method stub
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		

		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update project "
						+ "set project_Name=?, proj_Start_Date=?, proj_End_Date=?, Client_id_Client=? "
						+ "where id_Project=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setString(1, project.getProjectName());
			myStmt.setDate(2, (Date) project.getStartDate());
			myStmt.setDate(3, (Date) project.getEndDate());
			myStmt.setInt(4, project.getClientID());
			myStmt.setInt(5, project.getProjectID());
			
			// execute SQL statement
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}

	public Project getProject(String theProjectID) throws Exception {
		// TODO Auto-generated method stub
		Project theProject = null;
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int projectID;
		
		try {
			// convert student id to int
			projectID = Integer.parseInt(theProjectID);
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql to get selected student
			String sql = "select * from project where id_Project=?";
			
			// create prepared statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, projectID);
			
			// execute statement
			myRs = myStmt.executeQuery();
			
			// retrieve data from result set row
			if (myRs.next()) {
				String projectName = myRs.getString("project_Name");
				Date startDate = myRs.getDate("proj_Start_Date");
				Date endDate = myRs.getDate("proj_End_Date");
				int clientID = myRs.getInt("Client_id_Client");

				// use the studentId during construction
				theProject = new Project(projectID, projectName, startDate, endDate, clientID);
			}
			else {
				throw new Exception("Could not find project id: " + projectID);
			}				
			
			return theProject;
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, myRs);
		}
	}

	public void addProject(Project newProject) throws Exception{
		// TODO Auto-generated method stub
		// TODO Andrea
		
				Connection myConn = null;
				PreparedStatement myStmt = null;
				
				try {
					
				// get db connection
				myConn = dataSource.getConnection();
				
				// Create sql statment
				//INSERT INTO project (project_Name,proj_Start_Date,proj_End_Date,Client_id_Client) VALUES ('Applesoft','2018-01-01','2019-05-07',1);
				
				String sql = "insert into project "
						+ "(project_Name, proj_Start_Date, proj_End_Date,Client_id_Client) "
						+"values ( ?, ?, ?, ?)";
				
				myStmt = myConn.prepareStatement(sql);
				
				//set the param value for the student
				
				myStmt.setString(1, newProject.getProjectName());
				myStmt.setDate(2, (Date) newProject.getStartDate());
				myStmt.setDate(3, (Date) newProject.getEndDate());
				myStmt.setInt(4, newProject.getClientID());
				
				
				//execute sql insert
				
				myStmt.execute();
				
				}
				finally {
				//clean up jdbc object
					close (myConn, myStmt, null);
				}
	}


	public void addTask(Task theTask) throws SQLException {
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get db connection
			myConn = dataSource.getConnection();		
			
			// create the sql insert
			String sql = "INSERT INTO task (task_Name, task_Description,Employee_id_Employee,project_id_Project) VALUES (?,?,?,?);";
			
			myStmt = myConn.prepareStatement(sql);
			
			// set the parameter values for the employee
			myStmt.setString(1, theTask.getTaskName());
			myStmt.setString(2, theTask.getTaskDesc());
			myStmt.setInt(3, theTask.getEmployeeID());
			myStmt.setInt(4, theTask.getProjectID());
			
			// execute sql insert
			myStmt.execute();
		}
			
		finally {
			
			close(myConn, myStmt, null);
		}
		
	}

	public Employee getEmployee(String theEmployeeID) throws Exception{
		Employee theEmployee = null;
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int EmployeeID;
		
		try { 
			EmployeeID = Integer.parseInt(theEmployeeID);
			
			myConn = dataSource.getConnection();
			
			String sql = "select * from employee where id_Employee=?";
					
			myStmt = myConn.prepareStatement(sql);
		
			myStmt.setInt(1, EmployeeID);
			
			myRs = myStmt.executeQuery();
			
			if (myRs.next()) {
		
				String firstName = myRs.getString("first_Name");
				String lastName = myRs.getString("last_Name");
				String passWord = myRs.getString("hash");
				String gender = myRs.getString("gender");
				String email = myRs.getString("email");
				
		
				theEmployee = new Employee (EmployeeID, firstName, lastName,  passWord, gender, email); 
			} 
		
			else { 
				throw new Exception("could not find EmployeeID:  " + EmployeeID);
			}
	
		return theEmployee;
	
		} 
	
		finally {
			close(myConn, myStmt, null);
		}
	}

	public void updateEmployee(Employee employee) throws Exception {
		
		// TODO Auto-generated method stub

		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			myConn = dataSource.getConnection();
			
			String sql = "UPDATE employee " 
						+ "set first_Name=?, last_Name=?, gender=?, email=? " 
						+ "WHERE id_Employee=?";
			
			myStmt = myConn.prepareStatement(sql);
			
			
			myStmt.setString(1, employee.getFirstName());
			myStmt.setString(2, employee.getLastName());
			myStmt.setString(3, employee.getGender());
			myStmt.setString(4, employee.getEmail());
			myStmt.setInt(5, employee.getEmpID());
			
			
			myStmt.execute();
		}
		finally {
			close(myConn, myStmt, null);
		
		}
	}
		
		
		
	public void deleteProject(String theProjectId) throws Exception {
			// TODO Auto-generated method stub
			
			Connection myConn = null;
			PreparedStatement myStmt = null;
			
		try {
		//convert project id to int
		
		int projectId = Integer.parseInt(theProjectId);
		
		//get connection to database
		
		myConn = dataSource.getConnection();
		
		//create sql to delete project
		
		String sql= "delete from employee_has_project where Project_id_Project=?";
		
		//prepare statement
		
		myStmt = myConn.prepareStatement(sql);
		
		//set param
		
		myStmt.setInt(1, projectId);
		
		//execute sql
		
		myStmt.execute();
				
		sql="delete from task where project_id_Project=?";
		
		//prepare statement
		
		myStmt = myConn.prepareStatement(sql);
		
		//set param
		
		myStmt.setInt(1, projectId);
		
		//execute sql
		
		myStmt.execute();
		
		sql="delete from project where id_Project=?";
		
		//prepare statement
		
		myStmt = myConn.prepareStatement(sql);
		
		//set param
		
		myStmt.setInt(1, projectId);
		
		//execute sql
		
		myStmt.execute();
		
						
		}	
		finally {
		
		//clean up JDBC code	
		close(myConn, myStmt,null);	
		}
				
	}		
		
	public void deleteTask(String theTaskId) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
		
		//convert task id to int		
		int taskId = Integer.parseInt(theTaskId);
		
		//get connection to database		
		myConn = dataSource.getConnection();
		
		//create sql to delete task		
		String sql= "delete from task where id_Task =?";
		
		//prepare statement		
		myStmt = myConn.prepareStatement(sql);
		
		//set param		
		myStmt.setInt(1, taskId);
		
		//execute sql		
		myStmt.execute();
		
		}	
		
		finally {
		
		//close connection
			close(myConn,myStmt,null);
		
		}
		
	}	
	
	public void addClient(Client theClient) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get db connection
			myConn = dataSource.getConnection();		
			
			// create the sql insert
			String sql = "insert into client "
						+ "(client_Name, client_Address, client_Email) "
						+ "values (?, ?, ?)";
			
			myStmt = myConn.prepareStatement(sql);
			
			// set the parameter values for the employee
			myStmt.setString(1, theClient.getClientName());
			myStmt.setString(2, theClient.getClientAddress());
			myStmt.setString(3, theClient.getClientEmail());
			
			// execute sql insert
			myStmt.execute();
		}
			
		finally {
			
			close(myConn, myStmt, null);
		}
		
	}


	public Client getClient(String theClientID) throws Exception {
		
		Client client = null;
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int clientID;
		
		try { 
			clientID = Integer.parseInt(theClientID);
			
			myConn = dataSource.getConnection();
			
			String sql = "select * from client where id_Client=?";
					
			myStmt = myConn.prepareStatement(sql);
		
			myStmt.setInt(1, clientID);
			
			myRs = myStmt.executeQuery();
			
			if (myRs.next()) {
		
				String clientName = myRs.getString("client_Name");
				String clientAddress = myRs.getString("client_Address");
				String clientEmail = myRs.getString("client_Email");
				
				
		
				 client = new Client (clientID, clientName, clientAddress, clientEmail); 
			} 
			else { 
				throw new Exception("could not find ClientID:  " + clientID);
			}
	
		return client;
	
		} 
	
		finally {
			close(myConn, myStmt, myRs);
		}
		
	}


	public void updateClient(Client client) throws Exception{
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			myConn = dataSource.getConnection();
			
			String sql = "UPDATE client " 
						+ "set  client_Name=?, client_Address=?, client_Email=?" 
						+ "WHERE id_Client=?";
			
			myStmt = myConn.prepareStatement(sql);
			
			myStmt.setString(1, client.getClientName());
			myStmt.setString(2, client.getClientAddress());
			myStmt.setString(3, client.getClientEmail());
			myStmt.setInt(4, client.getClientID());

			
			
			
			myStmt.execute();
		}
		finally {
			close(myConn, myStmt, null);
		
		}
		
		
	}


	public void deleteClient(String theClientId) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
		
		//convert client id to int
		
		int clientId = Integer.parseInt(theClientId);
		
		//get connection to database
		
		myConn = dataSource.getConnection();
		
		
		String sql = "select ej.Project_id_Project FROM employee_has_project ej\r\n"
				+ "LEFT JOIN project p ON p.id_Project = ej.Project_id_Project\r\n"
				+ "WHERE Client_id_Client =?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, clientId);
		myRs = myStmt.executeQuery();

		while(myRs.next()) {
		
		//create sql to delete client
		String sql2= "delete from employee_has_project where Project_id_Project =?";
		//prepare statement
		myStmt = myConn.prepareStatement(sql2);
		//set param
		myStmt.setInt(1, myRs.getInt("Project_id_Project"));
		//execute sql
		myStmt.execute();
		}
		
		sql = "select project_id_Project from task \r\n"
				+ "left join project p on p.id_Project = task.project_id_Project\r\n"
				+ "where Client_id_Client = ?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, clientId);
		myRs = myStmt.executeQuery();
		
		while(myRs.next()) {
			
		//create sql to delete client
		String sql2= "delete from task where Project_id_Project =?";
		//prepare statement
		myStmt = myConn.prepareStatement(sql2);
		//set param
		myStmt.setInt(1, myRs.getInt("project_id_Project"));
		//execute sql
		myStmt.execute();
		}
		sql = "delete from project where Client_id_Client=?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, clientId);
		myStmt.execute();
		
		sql = "delete from task where Employee_id_Employee=?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, clientId);
		myStmt.execute();
		
		sql = "delete from client where id_Client=?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, clientId);
		myStmt.execute();
		
		}
		finally {
		
		//close connection
			close(myConn,myStmt,null);
		
		}
		
	}


	public void assignToProject(String[] assignedEmp, String projectId) throws Exception{
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
			
			//get connection to database
			
			myConn = dataSource.getConnection();
			
			ArrayList<String> listOfOldEmp = new ArrayList<>();
			listOfOldEmp = getAssignedEmployees(projectId);
			
			ArrayList<String> assignedEmps = new ArrayList<>();
			for (String emp : assignedEmp) {
				assignedEmps.add(emp);
			}
			
			for (String oldEmp : listOfOldEmp) {
				//search the new list of employees to see if it contains any old employees
				
				if(assignedEmps.contains(oldEmp)) {
					//remove from list
					assignedEmps.remove(oldEmp);
					
				} else {
					//DELETE FROM DATABASE
					String sql ="DELETE FROM employee_has_project  WHERE  Employee_id_Employee = ? and Project_id_Project =?;";
				//prepare statement
					myStmt = myConn.prepareStatement(sql);
					//set param
					myStmt.setInt(1, Integer.parseInt(oldEmp));
					myStmt.setString(2, projectId);
				//execute sql	
					myStmt.execute();
				}
			}
			
			
			for (String emp : assignedEmps) {
				
			
			//create sql to create employee has project
				String sql ="INSERT INTO employee_has_project (Employee_id_Employee,Project_id_Project) VALUES (?,?);";
			//prepare statement
				myStmt = myConn.prepareStatement(sql);
				//set param
				myStmt.setInt(1, Integer.parseInt(emp));
				myStmt.setString(2, projectId);
			//execute sql	
				myStmt.execute();
			
			}
		}
		finally {
			//close connection
			close(myConn,myStmt,null);
		}
		
	}


	public Task getTask(String theTaskID) throws Exception{
		
		Task theTask = null;
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet  myRs =null;
		int taskID;
		
		try {
			// convert task id to int
			taskID = Integer.parseInt(theTaskID);
			// get connection to database
			myConn = dataSource.getConnection();
			// create sql to get sel task
			String sql = "select * from task where id_Task=?";
			// create  prepared statement
			myStmt = myConn.prepareStatement(sql);
			// set params
			myStmt.setInt(1, taskID);
			// execute query
			myRs = myStmt.executeQuery();
			
			if (myRs.next()) {
				
				String taskName = myRs.getString("task_Name");
				String taskDesc = myRs.getString("task_Description");
				int employeeID = myRs.getInt("Employee_id_Employee");
				int projectID = myRs.getInt("project_id_Project");
				
				theTask =new Task (taskID, employeeID, taskDesc, taskName, projectID);
				
				
			}
			else 
			{
				throw new Exception ("Could not find TASK ID: "+ taskID);	
			}	
			return theTask;
	}
		finally 
		{
			close(myConn, myStmt,null);	
		}
		
		
	}


	public void updateTask(Task theTask) throws Exception{

		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			myConn = dataSource.getConnection();
			
			String sql = "delete from task where id_Task=?;";
			
			myStmt = myConn.prepareStatement(sql);
		
			myStmt.setInt(1, theTask.getTaskID());

			myStmt.execute();
			
			sql = "INSERT INTO task (id_Task,task_Name, task_Description,Employee_id_Employee,project_id_Project) VALUES (?,?,?,?,?);";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, theTask.getTaskID());
			myStmt.setString(2, theTask.getTaskName());
			myStmt.setString(3, theTask.getTaskDesc());
			myStmt.setInt(4, theTask.getEmployeeID());
			myStmt.setInt(5, theTask.getProjectID());
			
			myStmt.execute();
		}
		finally {
			close(myConn, myStmt, null);
		
		}
		
		
		
	}


	public ArrayList<String> getAssignedEmployees(String theProjectID) 
			throws Exception {
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
			
			//get connection to database
			
			myConn = dataSource.getConnection();
			
			String sql = "select * FROM team_manager_db.employee_has_project where Project_id_Project=?;";
			//prepare statement
			myStmt = myConn.prepareStatement(sql);
			//set param
			myStmt.setInt(1, Integer.parseInt(theProjectID));
			myRs=myStmt.executeQuery();
			
			ArrayList<String> listOfOldEmp = new ArrayList<>(); 
			
			while (myRs.next()) {
				
				// retrieve data from result set row
				String id = myRs.getString("Employee_id_Employee");
				listOfOldEmp.add(id);
			}
			
			return listOfOldEmp;
		}
			finally {
				close(myConn, myStmt, null);
			
			}
		
	} 
		
} 


	

