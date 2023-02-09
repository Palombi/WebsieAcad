package team_management;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	//Define datasource/connection pool for Resources Injection
	@Resource(name="jdbc/team_manager_db")
	private DataSource dataSource;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1 Set up printwriter
		PrintWriter out =response.getWriter();
		response.setContentType("text/plain");
		
		// 2 Get connection to database
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			
			myConn = dataSource.getConnection();
			
			//3 Create a sql Statements
			
			String sql = "select * from client";
			myStmt = myConn.createStatement();
			
			//4 Execute SQL statements
			myRs = myStmt.executeQuery(sql);
			
			while (myRs.next()) {
				String clientID = myRs.getString("id_Client");
				String clientName = myRs.getString("client_Name");
				String clientAdd = myRs.getString("client_Address");
				String clientEmail = myRs.getString("client_Email");
				
				out.println(clientID + " " + clientName + " " + clientAdd + " " + clientEmail);
				
			}
			
			//3 Create a sql Statements
			
			sql = "select * from employee";
			myStmt = myConn.createStatement();
			
			//4 Execute SQL statements
			myRs = myStmt.executeQuery(sql);
			
			while (myRs.next()) {
				int id = myRs.getInt("id_Employee");
				String firstName = myRs.getString("first_Name");
				String lastName = myRs.getString("last_Name");
				String password = myRs.getString("password");
				String gender = myRs.getString("gender");
				String email = myRs.getString("email");
				
				out.println(id + " " + firstName);
				
			}
			
			
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
		
		
		
	}



}
