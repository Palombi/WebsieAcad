<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Task Trial</title>
	
</head>
<body>
<script src="scripts/LoginTokenCheck.js"></script>
<script src="scripts/ColorTheme.js"></script>
<!--  <input type="button" value = "LISTTask" >Show All Projects</input> -->

	<div id="wrapper">
		<div id="header">
			<h2>Task Test</h2>
		</div>
	</div>
	
	<a href="taskForm.jsp">ADD TASK</a>

<table>
			
				<tr>
					<th>Task ID</th>
					<th>Employee ID</th>
					<th>Task Description</th>
					<th>Task Name</th>
					<th>Project ID</th>
				</tr>
				
				<c:forEach var = "tempPRO" items="${TASK_LIST}">
				
								<!--  setup link to update task -->
				<c:url var = "updateLink" value = "employeeControllerServlet">
				<c:param name="command" value="LOADTASK" />
				<c:param name = "taskID" value="${tempTAS.taskID}"/>
					
				</c:url>
				
				<!-- set up link to delete a task -->	
				<c:url var="deleteLink" value="employeeControllerServlet">
				<c:param name="command" value="DELETETASK" />
				<c:param name="taskID" value="${tempPRO.taskID}" />
				</c:url>  


					
				
				<tr>
					<td> ${tempPRO.taskID} </td>
					<td> ${tempPRO.employeeID} </td>
					<td> ${tempPRO.taskDesc} </td>
					<td> ${tempPRO.taskName} </td>
					<td> ${tempPRO.projectID} </td>
					<td><a href="${tempLink}">Update</a> | 
							<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this task?')))return false">
							Delete</a></td>

				</tr>
				</c:forEach>
			
				
			</table>
			
			<c:url var="employeeLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTEMPLOYEE" />
				</c:url>  
			<a href="${employeeLink}">Go To Employee Page</a>
</body>
</html><!-- ADD YOUR CODE FOR TASK TABLE DATABASE INTERACTION HERE -->