package team_management;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class employeeControllerServlet
 */
@WebServlet("/employeeControllerServlet")
public class employeeControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ManagerUtil ManagerUtil;
	
	//Define datasource/connection pool for Resources Injection
	@Resource(name="jdbc/team_manager_db")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			ManagerUtil = new ManagerUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//read command parameter
			String theCommand = request.getParameter("command");
			
			//if the command is missing, then default to listing students
			
			if (theCommand == null) {
				theCommand = "LOGINPAGE";
			}
			
			//route it to the appropriate method
			
			switch (theCommand) {

				case "OFFLINE"		:// Andrea 
						//TO DO 
						offlineAddEmployee(request, response);
						break;
						
				case "LOGINPAGE"		:// Leon (Done)
						loginPage(request, response);
						break;
			
				case "LISTEMPLOYEE"		:// Leon (Done)
						listEmployee(request, response);
						break;
						
				case "ADDEMPLOYEE" 		: // Alex (Done)
						addEmployee(request,response);
						break;
						
				case "DELETEEMPLOYEE" 	: //Andrea (Done)
						deleteEmployee(request,response);
						break;
						
				case "LOADEMPLOYEE": //Jamie (Done)
						loadEmployee(request,response);
						break;
						
				case "UPDATEEMPLOYEE"	: //Jamie (Done)
						updateEmployee(request,response);
						break;		
						
				case "LISTTASK"	: //Mark (DONE)
						listTask(request,response);
						break;			
						
				case "ADDTASK"	: // Alex (Done)
						addtask(request,response);
						break;
						
				case "DELETETASK"	://Mark (Done)
						deleteTask(request,response);
						break;
						
				case "UPDATETASK"	://Riaz (Done)
						updatetask(request,response);
						break;
						
				case "LISTPROJECT" : // Chris (Done)
						listProject(request,response);
						break;
						
				case "ADDPROJECT" : //Andrea/Alex (Done)
						addProject(request,response);
						break;
						
				case "DELETEPROJECT" : //Will Gutierrez (Done)
						deleteProject(request,response);
						break;
						
				case "LOADPROJECT" : //Leon (DONE)
						loadProject(request,response);
						break;
						
				case "UPDATEPROJECT" : //Leon (DONE)
						updateProject(request,response);
						break;
						
				case "LISTCLIENT" ://mattyP (Done)
						listClient(request,response);
						break;
						
				case "ADDCLIENT" : //Alex Cikos (Done)
						addClient(request,response);
						break;
						
				case "DELETECLIENT" : //Will Gutierrez (Done)
						deleteClient(request,response);
						break;
						
				case "UPDATECLIENT" ://Jamie Lower (Done)
						updateClient(request,response);
						break;
						
				case "LOADCLIENT" : //Jamie Lower(Done)
						loadClient(request,response);
						break;
						
				case "ASSIGNTOPROJECT" : //Leon/Andrea (done)
						assignToProject(request,response);
						break;
						
				case "LOADTASK"	: // Riaz(Done)
						loadTask(request,response);
						break;	
					
				case "LOADASSIGNPROJECT" : //Leon & Andrea
						loadAssignProject(request,response);
						break;				
 					
				default:
					listEmployee(request,response);
				}
			
			}
			catch (Exception exc) {
				exc.printStackTrace();
			}
	}

	private void offlineAddEmployee(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		//GRAB PARAMETERS
		String nameEmp = request.getParameter("nameEmp");
		String lastNameEmp = request.getParameter("lastNameEmp");
		String empPassword = request.getParameter("empPassword");
		String empGender = request.getParameter("empGender");
		String empEmail = request.getParameter("empEmail");
		
		byte[] salt = Hash.generateSalt();
		
		System.out.println(nameEmp);
		System.out.println(lastNameEmp);
		System.out.println(empPassword);
		System.out.println(empGender);
		System.out.println(empEmail);
		if (nameEmp !=null || lastNameEmp !=null ||empPassword !=null ||empGender !=null || empEmail!= null) {
			
		String hash = Hash.hashPassword(salt, empPassword);
		
		//create a new employee object
		Employee theEmployee = new Employee(nameEmp, lastNameEmp, hash, empGender, empEmail, salt);		
 		// add the employee to the database
		ManagerUtil.addEmployee(theEmployee);
			
			
		}
		
		
		
		
		
	}

	private void loginPage(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {
		
		List<Employee> employees = ManagerUtil.getEmployees();
		
		List<String> empEmails = new ArrayList<>();
		List<String> empPasswords = new ArrayList<>();
		
		for (Employee emp : employees) {
			empEmails.add(emp.getEmail());
			empPasswords.add(emp.getHash());
		}
		
		request.setAttribute("EMP_EMAILS", empEmails);
		request.setAttribute("EMP_PASS", empPasswords);
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
		
	}

	private void loadAssignProject(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {

		String theProjectID = request.getParameter("projectID");
		
		//get list of employees from database
		ArrayList<String> listEmp = new ArrayList<>();
		listEmp = ManagerUtil.getAssignedEmployees(theProjectID);
		
		request.setAttribute("OLD_EMP_LIST", listEmp);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ProjectTestAssign.jsp");
		dispatcher.forward(request, response);
		
	}

	private void loadTask(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// read student id from form data
		String theTaskID = request.getParameter("taskID");
				
		// get student from database (db util)
		Task theTask = ManagerUtil.getTask(theTaskID);
				
		// place student in the request attribute
		request.setAttribute("TASK", theTask);
				
		// send to jsp page: update-student-form.jsp
		RequestDispatcher dispatcher = 
		request.getRequestDispatcher("/TaskTestUpdate.jsp");
		dispatcher.forward(request, response);		
				
		
	}

	private void assignToProject(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String assignedEmp[] = request.getParameterValues("addEmp");
		String projectId = request.getParameter("projectID");
		
		ManagerUtil.assignToProject(assignedEmp,projectId);
		
//		request.setAttribute("EmpNumbers", assignedEmp);
		
		
		listProject(request,response);
		
	}

	private void loadClient(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String theClientID = request.getParameter("clientID");
		
		Client client = ManagerUtil.getClient(theClientID);
		
		request.setAttribute("CLIENT", client);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ClientTestUpdate.jsp");
		dispatcher.forward(request, response);
		
	}

	private void loadEmployee(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String theEmployeeID = request.getParameter("employeeId");
		
		Employee theEmployee = ManagerUtil.getEmployee(theEmployeeID);
		
		request.setAttribute("EMPLOYEE", theEmployee);
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("/EmployeeTestUpdate.jsp");
		dispatcher.forward(request, response);
		
		// TODO Auto-generated method stub
		
	}

	private void loadProject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		// read student id from form data
		String theProjectID = request.getParameter("projectID");
		
		// get student from database (db util)
		Project theProject = ManagerUtil.getProject(theProjectID);
		
		// place student in the request attribute
		request.setAttribute("PROJECT", theProject);
		
		// send to jsp page: update-student-form.jsp
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/ProjectTestUpdate.jsp");
		dispatcher.forward(request, response);		
		
	}

	
	private void updateClient(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		// read student info from form data
		int id = Integer.parseInt(request.getParameter("clientID"));
		String clientName = request.getParameter("clientName");
		String clientAddress = request.getParameter("clientAddress");
		String clientEmail = request.getParameter("clientEmail");
		
		// create a new student object
		Client client = new Client(id, clientName, clientAddress, clientEmail);
		
		// perform update on database
		ManagerUtil.updateClient(client);
		
		// send them back to the "list students" page
		listClient(request, response);
		
		
	}

	
	private void deleteClient(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String theClientId = request.getParameter("clientID");
		
		//delete client from database
		
		ManagerUtil.deleteClient(theClientId);
		
		//send them back to "list client" page
		listClient(request,response);
		
		
	}
		
	private void addClient(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// read employee info from form data
			String clientName = request.getParameter("clientName");
			String clientAddress = request.getParameter("clientAddress");
			String clientEmail = request.getParameter("clientEmail");
			
			
			// create a new employee object
			Client theClient = new Client(clientName, clientAddress, clientEmail);		
	 		// add the employee to the database
			ManagerUtil.addClient(theClient);
			
			// send back to the main page (the employee list)
			listClient(request, response);
				
	}

	private void listClient(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {
		// TODO Auto-generated method stub
				// my code
							
				// TODO 
				
				//get Employees from db util
				List<Client> clients = ManagerUtil.getClients();
				
				//add employees to the request
				request.setAttribute("Client_LIST", clients);
				
				//send to jsp page
				RequestDispatcher dispatcher = request.getRequestDispatcher("/clients.jsp");
				dispatcher.forward(request, response);
							
	}

	
	private void updateProject(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		
		
		// read project update info from form data
		int id = Integer.parseInt(request.getParameter("projectID"));
		String projectName = request.getParameter("projectName");
		
		String tempDate = request.getParameter("startDate");
		Date startDate = Date.valueOf(tempDate);
		
		LocalDate localStartDate = startDate.toLocalDate().plusDays(1);
		startDate = Date.valueOf(localStartDate);
		
		tempDate = request.getParameter("endDate");
		Date endDate = Date.valueOf(tempDate);
		
		LocalDate localEndDate = endDate.toLocalDate().plusDays(1);
		endDate = Date.valueOf(localEndDate);
		
		int clientID = Integer.parseInt(request.getParameter("clientID"));
		
		// create a new project object
		Project project = new Project(id, projectName, startDate, endDate, clientID);
		
		// perform update on database
		ManagerUtil.updateProject(project);
		
		
		//Add or remove employee from project
		
		//Getting a list of employees based on checkbox selection
		
		//going to manager util to add employee has projects
		
		
		
		// send them back to the "list projects" page
		listProject(request, response);
		
	}

	private void deleteProject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//read project id from data
		
		String theProjectId = request.getParameter("projectID");
			
		//delete project from database
			
		ManagerUtil.deleteProject(theProjectId);
			
		//send them back to "list project" page
		
		listProject(request,response);
		
	}

	private void addProject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		//read student info from data
				String nameProject = request.getParameter("nameProject");
				String startdate = request.getParameter("startDate");
				String endDate = request.getParameter("endDate");
				String nameOfClient = request.getParameter("client");
				String listofClient[] = nameOfClient.split(":");
				int idClient = Integer.parseInt(listofClient[0]);
				
				//convert String to Date
				
				Date startDate = Date.valueOf(startdate);
				Date theEndDate = Date.valueOf(endDate);
				
				
				//create a new Project object
				Project newProject = new Project (nameProject,startDate,theEndDate,idClient);
				
				
				//add the project to database
				
				ManagerUtil.addProject(newProject);
				
				//send back to main page (the project list)
				listProject(request,response);
				
	}

	//chris start
	private void listProject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO 
		
				//get Projects from db util
				List<Project> projects = ManagerUtil.getProjects();
				
				//add projects to the request
				request.setAttribute("PRO_LIST", projects);
				
				List<Client> clients = ManagerUtil.getClients();
				
				request.setAttribute("CLIENT_LIST", clients);	
				
				List<Employee> employees = ManagerUtil.getEmployees();
				
				request.setAttribute("EMP_LIST", employees);

				//send to jsp page
				RequestDispatcher dispatcher = request.getRequestDispatcher("/projects.jsp");
				dispatcher.forward(request, response);
				
			}
	
	//chris end
	public void listEmployee(HttpServletRequest request, HttpServletResponse response) 
		throws Exception{
		// TODO 
		
		//get Employees from db util
		List<Employee> employees = ManagerUtil.getEmployees();
		
		//add employees to the request
		request.setAttribute("EMP_LIST", employees);
		
		
		//send to jsp page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/employees.jsp");
		dispatcher.forward(request, response);	
	}

	// <ALEX> adding employee details from the form data
	public void addEmployee(HttpServletRequest request, HttpServletResponse response) 
			throws Exception { 
			
			// read employee info from form data
			
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String passWord = request.getParameter("passWord");
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			
			byte[] salt = Hash.generateSalt();
			
			String hash = Hash.hashPassword(salt, passWord);
			
			// create a new employee object
			Employee theEmployee = new Employee(firstName, lastName, hash, gender, email, salt);		
	 		// add the employee to the database
			ManagerUtil.addEmployee(theEmployee);
			
			// send back to the main page (the employee list)
			listEmployee(request, response);
			
		}
	
	public void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		//read employee id from data		
		String theEmployeeId = request.getParameter("employeeID");
		
		//delete student from database		
		ManagerUtil.deleteEmployee(theEmployeeId);
		
		//send them back to "list employee" page
		listEmployee(request,response);	
	}

	public void updateEmployee(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {
		// TODO Auto-generated method stub
		
		
				// read student info from form data
				int id = Integer.parseInt(request.getParameter("employeeID"));
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String gender = request.getParameter("gender");
				String email = request.getParameter("email");
				// create a new student object
				Employee employee = new Employee(id, firstName, lastName, gender, email);
				
				// perform update on database
				ManagerUtil.updateEmployee(employee);
				
				// send them back to the "list students" page
				listEmployee(request, response);
	}
	

	public void listTask(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
			
			// get tasks from db util
			List<Task> tasks = ManagerUtil.getTasks();
			
			// add students to the request
			request.setAttribute("TASK_LIST", tasks);
			
			List<Employee> employees = ManagerUtil.getEmployees();
			request.setAttribute("EMP_LIST", employees);	
			List<Project> projects = ManagerUtil.getProjects();
			request.setAttribute("PROJ_lIST", projects);	
			
			// send to JSP page (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/tasks.jsp");
			dispatcher.forward(request, response);	
		}
	

	public void addtask(HttpServletRequest request, HttpServletResponse response) throws Exception {
					// read employee info from form data
					String taskName = request.getParameter("taskName");
					String taskDesc = request.getParameter("taskDesc");
					String employeeID = request.getParameter("employeeID");
					String projectID = request.getParameter("projectID");
					
					String listofempID[] = employeeID.split(":");
					int theEmpID = Integer.parseInt(listofempID[0]);
					
					String listofprojID[] = projectID.split(":");
					int theProjectID = Integer.parseInt(listofempID[0]);
					
					// create a new employee object
					Task theTask = new Task( theEmpID, taskDesc, taskName, theProjectID);		
			 		// add the employee to the database
					ManagerUtil.addTask(theTask);
					
					// send back to the main page (the employee list)
					listTask(request, response);
		
	}

	
	public void deleteTask(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		//read task id from data
		String theTaskId = request.getParameter("taskID");

        //delete task from database
        ManagerUtil.deleteTask(theTaskId);

        //send them back to "list task" page
        listTask(request,response);	
	}

	public void updatetask(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// read student info from form data
			int id = Integer.parseInt(request.getParameter("taskID"));
			String taskName = request.getParameter("taskName");
			String taskDesc = request.getParameter("taskDesc");	
			int empId = Integer.parseInt(request.getParameter("employeeID"));
			int projID = Integer.parseInt(request.getParameter("projId"));
			// create a new employee object
			Task theTask = new Task(id,empId, taskDesc, taskName,projID);		
			 // add the employee to the database
			ManagerUtil.updateTask(theTask);
					
			// send back to the main page (the employee list)
			listTask(request, response);

		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("emailValue");
		String password = request.getParameter("passwordValue");
		boolean cont = false;
		
		try {
			List<Employee> employees = ManagerUtil.getEmployees();
			
			for (Employee emp : employees) {
				
				if (username.equals(emp.getEmail())) {
				
					String hash = Hash.hashPassword(emp.getSalt(), password);
					
					if (hash.equals(emp.getHash())) {
						cont = true;
						
					} else {
						cont = false;
					}
				} 
			}
			if (cont) {
				request.setAttribute("pass", "true");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("invalid", "Wrong Information!");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}

	
