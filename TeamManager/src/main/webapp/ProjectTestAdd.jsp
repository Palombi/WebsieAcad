<%@page import="team_management.ManagerUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update Project</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Heebo:wght@300;400;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="css/style.css" />
    <script src="myScript.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src=https://code.jquery.com/jquery-1.12.4.js></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
<script src="scripts/LoginTokenCheck.js"></script>
<div id="wrapper">
<div id="header">
</div>
</div>

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
            <a class="nav-link" href="${taskLink}">Tasks</a>
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
            <a class="nav-link active" href="${projectLink}">Projects</a>
          </li>
        </ul>
      </form>
      <!-- nav section end -->



<form onsubmit="return ProjectAddValidation()" action="employeeControllerServlet" method="GET" class="card" style="box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5); margin: 5rem;">

	<input type="hidden" name="command" value="ADDPROJECT"/>
	<h3 class="card-footer">Add Project</h3>
	
	
	<table class="card-text">
	<tbody>
		<tr>
		<td><label></label></td>
		<td><span id="project-name-error" class="error"></span></td>
		</tr>
		<tr>
			
			<td><label class="card-text" style="margin-left: 10%">Project name:</label></td>
			<td><input class="card-text" type="text" name="nameProject" style="width: 90%;"/></td>
		</tr>
		<tr>
		<td><label></label></td>
		<td><span id="project-start-date-error" class="error"></span></td>
		</tr>
		<tr>
			<td><label class="card-text" style="margin-left: 10%;">Start Date:</label></td>
				<td><input class="card-text" type="text" id="startDate" name="startDate" value="${PROJECT.startDate}" style="width: 90%; height: 100%;">

				<script>
				 $(function() {
					  $("#startDate").datepicker({
					  	dateFormat:"yy-mm-dd"
					    });
					  });
				</script>
			</td>
		</tr>
		<tr>
		<td><label></label></td><td><span id="project-end-date-error" class="error"></span></td>
		
		</tr>	
		<tr>
			
			<td><label class="card-text" style="margin-left: 10%;">End date:</label></td>	

			<td><input class="card-text" class="m-2" type="text" id="endDate" name="endDate" value="${PROJECT.endDate}" style="width: 90%;">
						<script>
						  $(function() {
						    $("#endDate").datepicker({
						    	dateFormat:"yy-mm-dd"
						    });
						  });
						</script>
			</td>
		</tr>
		<tr>
		<td><label></label></td>
		</tr>
		<tr>
			<td><label class="card-text" style="margin-left: 10%;">Client:</label></td>
				<td><select class="card-text" name="client" style="height: 50px; display: block; width: 90%; border: 2px solid #2980B9; font-size: 18px; border-radius: 5px; padding: .5rem; margin-top: -10px; margin-bottom: 10px;"> 
					<c:forEach var ="tempClient" items="${listClients}">
						<option>${tempClient.clientID}: ${tempClient.clientName}</option>
					</c:forEach>
					</select>
				</td>
		</tr>
		<tr>
			<td><label class="card-text"></label></td>
			<td><button type="submit" value="Save" class="m-2 btn btn-info" />Save</button></td>

		</tr>
	
		
	</tbody>
	
	</table>

</form>
	<div style="clear: both;" >
		<p>
			<c:url var="projectLink" value="employeeControllerServlet">
			<c:param name="command" value="LISTPROJECT" />
			</c:url>  
			<div class="btnTools">
				<button type="button" class="btn btn-info" onclick="window.location.href='${projectLink}'">
					<a href="${projectLink}">Back to List</a>
				</button>
			</div>
		</p>
		
	 </div>
		
</div>
<script src="scripts/ProjectAddValidation.js"></script>
<script src="scripts/ColorTheme.js"></script>
</body>

</html>