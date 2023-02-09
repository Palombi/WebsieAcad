<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Employee Trial</title>
	
</head>
<body>
<script src="scripts/LoginTokenCheck.js"></script>
<script src="scripts/ColorTheme.js"></script>
<!--  <input type="button" value = "LISTEMPLOYEE" >Show All Employees</input> -->

	<div id="wrapper">
		<div id="header">
			<h2>Employees Test</h2>
		</div>
	</div>

<a href="EmployeeTestForm.jsp">ADD EMPLOYEE</a>


<table>
			
				<tr>
					<th>Employee ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Password</th>
					<th>Gender</th>
					<th>email</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var = "tempEmp" items="${EMP_LIST}">
				
				<!-- set up link o delete a student -->	
				<c:url var="deleteLink" value="employeeControllerServlet">
				<c:param name="command" value="DELETEEMPLOYEE" />
				<c:param name="employeeID" value="${tempEmp.empID}" />
				</c:url>  

				<c:url var="updateLink" value="employeeControllerServlet">
        		<c:param name ="command" value = "LOADEMPLOYEE" />
        		<c:param name="employeeId" value="${tempEmp.empID}" />
        		</c:url>					
				
				<tr>
					<td> ${tempEmp.empID} </td>
					<td> ${tempEmp.firstName} </td>
					<td> ${tempEmp.lastName} </td>
					<td> ${tempEmp.passWord} </td>
					<td> ${tempEmp.gender} </td>
					<td> ${tempEmp.email} </td>
					<td><a href="${updateLink}">Update</a> | 
							<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this Employee?')))return false">
							Delete</a></td>

				</tr>
				</c:forEach> 
			
				
			</table>
			
			<c:url var="projectLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTPROJECT" />
				</c:url>  
			<a href="${projectLink}">Go To Project Page</a>
			
			<c:url var="clientLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTCLIENT" />
				</c:url>  
			<a href="${clientLink}">Go To Client Page</a>
			
			<c:url var="taskLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTTASK" />
				</c:url>  
			<a href="${taskLink}">Go To Task Page</a>
			
</body>
</html>