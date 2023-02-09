<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Form</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<script src="scripts/LoginTokenCheck.js"></script>
<!-- nav section start-->
   <form class="form-inline">
     <ul class="nav justify-content-center">
       <li class="nav-item">
         <a class="nav-link logout" href="index.jsp">Logout</a>
       </li>
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
    <div class="page-container">
    
    <!-- TEST -->

    <form action="employeeControllerServlet" method="GET" onsubmit="return taskAddValidation()"class="card" style="box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5); margin-top: 5rem; margin: 5rem;">
    	<input type ="hidden" name="command" value="ADDTASK">

        <h2 class="card-footer">Add Task</h2>
       	
        <input type="hidden" name="taskID" id="taskID" >
  		
  		<table class="card-text" style="border-collapse: seperate !important; border-spacing: 0 2rem;">
        <tbody>
        	<tr>
			<td><label></label></td>
			<td><span id="task-name-error" class="error"></span></td>
			</tr>
        	<tr>
        		<td><label class="card-text" style="margin-left: 10%;" for="taskName">Task Name</label></td>
        		<td><input class="card-text" type="text" name="taskName" id="taskName" style="width: 90%;">
        		</td>
        	</tr>
			<tr>
			<td><label></label></td>
			<td><span id="task-desc-error" class="error"></span></td>
			</tr>
  			<tr>
        		<td><label class="card-text" style="margin-left: 10%;" for="taskDesc">Task Description</label></td>
        		<td><input class="card-text" type="text" name="taskDesc" id="taskDesc" style="width: 90%;">
        		</td>
        	</tr>
        	<tr>
			<td><label></label></td>
			</tr>
			<tr>
        		<td><label class="card-text" style="margin-left: 10%;"for="employeeID">Employee Assigned:</label></td>
        		<td><select class="card-text" type="text" name="employeeID" id="employeeID" class="drop" style="height: 50px; display: block;  margin-bottom: 10px;  width: 90%; border: 2px solid #2980B9; font-size: 18px; border-radius: 5px; padding:10px;">  
			        	<c:forEach var ="tempEmployee" items="${listEmployees}">
							<option>${tempEmployee.empID}: ${tempEmployee.firstName} ${tempEmployee.lastName}</option>
						</c:forEach>
			</select></td>
        	</tr>
        	<tr>
			<td><label></label></td>
			</tr>
			<tr>
        		<td><label class="card-text" style="margin-left: 10%;" for="projectID">Project Assigned:</label></td>
        		<td><select class="card-text" type="text" name="projectID" id="gender" class="drop" style="height: 50px; display: block;  margin-bottom: 10px;  width: 90%; border: 2px solid #2980B9; font-size: 18px; border-radius: 5px; padding:10px;">
			        	<c:forEach var ="tempProjects" items="${listProjects}">
							<option>${tempProjects.projectID}: ${tempProjects.projectName}</option>
						</c:forEach>
					</select></td>
        	</tr>
        	<tr>
			<td><label></label></td>
			</tr>
  		</tbody>
  		</table>
		<div class="card-text">
			<input class="btn-form" style="width: 5rem; margin-left: 45%;" type="submit" name="save" value="Save" id="sendBtn">
		</div>
        
        
      </form>
      
    </div>
	
		<p>
			<c:url var="taskLink" value="employeeControllerServlet">
			<c:param name="command" value="LISTTASK" />
			</c:url>
			
			<div class="btnTools">
			<button type="button" class="btn btn-info" onclick="window.location.href='${taskLink}'">
				<a href="${taskLink}">Back to List</a>
			</button>
		</p>
	</div>
<script src="scripts/TaskAddValidation.js"></script>	
<script src="scripts/ColorTheme.js"></script>    
</body>
</html>