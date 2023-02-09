<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Client Trial</title>
	
</head>
<body>
<script src="scripts/LoginTokenCheck.js"></script>
<script src="scripts/ColorTheme.js"></script>

<!--  <input type="button" value = "LISTclient" >Show All CLients</input> -->

	<div id="wrapper">
		<div id="header">
			<h2>Client Test</h2>
		</div>
	</div>
	
	<a href="ClientTestAdd.jsp">ADD CLIENT</a>

<table>
			
				<tr>
					<th>Client ID</th>
					<th>Client Name</th>
					<th>Start Date</th>
					<th>End Date</th>
			
				</tr>
				
				<c:forEach var = "tempCLI" items="${Client_LIST}">
				
				<!-- set up link to delete a student -->	
				<c:url var="deleteLink" value="employeeControllerServlet">
				<c:param name="command" value="DELETECLIENT" />
				<c:param name="clientID" value="${tempCLI.clientID}" />
				</c:url>  

				<c:url var="updateLink" value="employeeControllerServlet">
				<c:param name="command" value="LOADCLIENT" />
				<c:param name="clientID" value="${tempCLI.clientID}" />
				</c:url>  
			
				<tr>
					<td> ${tempCLI.clientID} </td>
					<td> ${tempCLI.clientName} </td>
					<td> ${tempCLI.clientAddress} </td>
					<td> ${tempCLI.clientEmail} </td>
					<td><a href="${updateLink}">Update</a> | 
							<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this Client?')))return false">
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
