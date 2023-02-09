<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Project Trial</title>
	
</head>
<body>
<script src="scripts/LoginTokenCheck.js"></script>
<script src="scripts/ColorTheme.js"></script>
<input type="button" value="Add Project"
			onclick="window.location.href='ProjectTestAdd.jsp';return false;"
			/>

	<div id="wrapper">
		<div id="header">
			<h2>Project Test</h2>
		</div>
	</div>

<table>
			
				<tr>
					<th>Project ID</th>
					<th>Project Name</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Client Id</th>
				</tr>
				
				<c:forEach var = "tempPRO" items="${PRO_LIST}">
				
				<!-- set up link to delete a student -->	
				<c:url var="deleteLink" value="employeeControllerServlet">
				<c:param name="command" value="DELETEPROJECT" />
				<c:param name="projectID" value="${tempPRO.projectID}" />
				</c:url>  

				<c:url var="updateLink" value="employeeControllerServlet">
				<c:param name="command" value="LOADPROJECT" />
				<c:param name="projectID" value="${tempPRO.projectID}" />
				</c:url>  
					
				
				<tr>
					<td> ${tempPRO.projectID} </td>
					<td> ${tempPRO.projectName} </td>
					<td> ${tempPRO.startDate} </td>
					<td> ${tempPRO.endDate} </td>
					<td> ${tempPRO.clientID} </td>
					<td><a href="${updateLink}">Update</a> | 
							<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this Project?')))return false">
							Delete</a></td>

				</tr>
				</c:forEach>
			
				
			</table>
			
			<c:url var="employeeLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTEMPLOYEE" />
				</c:url>  
			<a href="${employeeLink}">Go To Employee Page</a>
</body>
</html>