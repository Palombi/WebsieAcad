<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<title>Update Task</title>
	<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src=https://code.jquery.com/jquery-1.12.4.js></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
<script src="scripts/LoginTokenCheck.js"></script>

	<div id="container">
	
	<!-- nav section start-->
      <form class="form-inline">
        <ul class="nav justify-content-center">
          <!-- <li class="nav-item">
            <a class="nav-link logout" href="index.jsp">Logout</a>
          </li> -->
          <li class="nav-item">
            <a class="nav-link" href="home.jsp">Home</a>
          </li>
          <li class="nav-item">
          <c:url var="clientLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTCLIENT" />
				</c:url>  
            <a class="nav-link" href="${clientLink}">Clients</a>
          </li>
          <li class="nav-item">
          <c:url var="taskLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTTASK" />
				</c:url>  
            <a class="nav-link active" href="${taskLink}">Tasks</a>
          </li>
          <li class="nav-item">
            <c:url var="employeeLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTEMPLOYEE" />
				</c:url>  
            <a class="nav-link" href="${employeeLink}">Employees</a>
          </li>
          <li class="nav-item">
            <c:url var="projectLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTPROJECT" />
				</c:url>  
            <a class="nav-link" href="${projectLink}">Projects</a>
          </li>
        </ul>
      </form>
      <!-- nav section end -->
	
		<form action="employeeControllerServlet" method="GET" class="card" style="box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5); margin-top: 5rem; margin: 5rem;">
		<h3 class="card-footer">Update Task</h3>
		
			<input type="hidden" name="command" value="UPDATETASK" />

			<input type="hidden" name="taskID" value="${TASK.taskID}" />
			
			<table class="card-text">
				<tbody>
				<tr>
				<td><label></label></td>
				</tr>				
				<tr>
					<td><label class="card-text" style="margin-left: 10%;">Employee ID</label></td>
					<td><input class="card-text" style="width: 90%;" type="text" name="employeeID" 
							value ="${TASK.employeeID}" /></td>
				</tr>
				<tr>
				<td><label></label></td>
				</tr>						
				<tr>
					<td><label class="card-text" style="margin-left: 10%;">Task Name:</label></td>
					<td><input class="card-text" style="width: 90%;" type="text" name="taskName" 
							value ="${TASK.taskName}" /></td>
				</tr>
				<tr>
				<td><label></label></td>
				</tr>						
				<tr>
					<td><label class="card-text" style="margin-left: 10%;">Task Description:</label></td>
					<td><input class="card-text" style="width: 90%;" type="text" name="taskDesc" 
							value ="${TASK.taskDesc}" /></td>
				</tr>
				<tr>
					<td><input class="card-text" type="text" name="projId" style="display: none;"
							value ="${TASK.projectID}" /></td>
				</tr>
					
				<tr>
					<td><label class="card-text"></label></td>
					<td><button type="submit" value="Save" class="m-2 btn btn-info">Save</button></td>
				</tr>
				</tbody>
			</table>
		</form>
		
		<div style="clear: both;"></div>
			 <p>
		<c:url var="taskLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTTASK" />
				</c:url>	
				<div class="btnTools">
			<button type="button" class="btn btn-info" onclick="window.location.href='${taskLink}'">
			<a href="${taskLink}">Go To Task List Page</a>
			</button>
	</div>	
		</p>
	</div>
<script src="scripts/ColorTheme.js"></script>	
</body>

</html>
		

















