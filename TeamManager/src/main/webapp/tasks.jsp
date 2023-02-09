<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Team Management</title>
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
    <link rel="stylesheet" href="css/overflow.css" />
    <script src="myScript.js"></script>
  </head>

<body>
<script src="scripts/LoginTokenCheck.js"></script>
<script src="scripts/TaskLocationReplace.js"></script>
    <div class="container">
      <!-- nav section start-->
      <form class="form-inline">
        <ul class="nav justify-content-center">
          <li class="nav-item">
            <c:url var="loginLink" value="employeeControllerServlet">
				<c:param name="command" value="LOGINPAGE" />
				</c:url>  
				<a class="nav-link" href="${loginLink}" onclick="deleteCookie()">Logout</a>
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

      <!-- button section start -->
      <div class="top" style="display: flex; justify-content: center; align-items: center;">
      <div class="btnTools">
        <button type="button" onClick="window.location.href='TaskTestAdd.jsp'" class="btn btn-info">
        ADD
        </button>
      </div>
      <!-- button section end -->
      
      <div>
          <input
          	class="card-text"
            type="search"
            placeholder="Search"     
            id="myInput"
            onkeyup="search()"
          />
        </div>
        
        <br/>
      </div>
      
      <!-- employee task section start -->
	<div class="card-deck" style="display: grid; grid-template-columns: 20rem 20rem 20rem;">
		<c:set var="listEmployees" value="${EMP_LIST}" scope="session" />
	    <c:set var="listProjects" value="${PROJ_lIST}" scope="session" />
      
	      
	     <c:forEach var = "tempTask" items="${TASK_LIST}">
	     
     		<c:url var="deleteLink" value="employeeControllerServlet">
			<c:param name="command" value="DELETETASK" />
			<c:param name="taskID" value="${tempTask.taskID}" />
			</c:url>  

			<c:url var="updateLink" value="employeeControllerServlet">
			<c:param name="command" value="LOADTASK" />
			<c:param name="taskID" value="${tempTask.taskID}" />
			</c:url>  
	      <div>
	        <div class="card" style="box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5); margin-bottom: 2px; height:18rem; width:18rem;">
	          <div class="card-body-task">
	            <h5 class="card-title">
	              Task ID: ${tempTask.taskID} <br/>
	              Task Name: ${tempTask.taskName}
	            </h5>
	            <div class="card-content-task">
		            <p class="card-text">
		              Description: ${tempTask.taskDesc} <br/>
		              Assigned Employee: ${tempTask.employeeID} <br/>
		              Assigned Project: ${tempTask.projectID}
		            </p>
	            </div>
	            
	          </div>
	          <div class="card-footer">
	          	<a class="footer-links" href="${updateLink}">Update</a> | 
					<a class="footer-links" href="${deleteLink}"
					onclick="if (!(confirm('Are you sure you want to delete this Task?')))return false">
					Delete</a>
					</td>
	          </div>
	        </div>
	        <br/>
	      </div>
	      	</c:forEach>
      </div>
      <!-- employee task section end -->
      </div>
      <script src="scripts/DivSearch.js"></script>
      <script src="scripts/ColorTheme.js"></script>
  </body>  
</html>
