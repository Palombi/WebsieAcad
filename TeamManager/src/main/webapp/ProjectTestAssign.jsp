<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee to Project</title>
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

    <div class="container" style="align: center;">
    
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
            <a class="nav-link active" href="${employeeLink}">Employees</a>
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

    <!-- TEST -->
   
	<div style="display: flex; justify-content: center; align-items: center;">
	
    <form action="employeeControllerServlet" method="GET" class="card" style="box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5); margin-top: 5rem; background: white; margin: 5rem; width: 15rem; align: center;">
    	<input type ="hidden" name="command" value="ASSIGNTOPROJECT">
    	<input type ="hidden" name="projectID" value="${param.projectID}">
    	
    	<c:set var="oldListEmployees" value="${OLD_EMP_LIST}" />

        <h2 class="card-footer">List of Employee</h2>
             <table class="card-text">
             <tbody>

			<c:forEach var ="tempEmployee" items="${listEmployees}">
				<c:set var="exists" value="1" />
				<c:forEach var="oldEmp" items="${oldListEmployees}">
				  <c:choose>
					  <c:when test="${oldEmp eq tempEmployee.empID}">
				    	<c:set var="exists" value ="0" />
					  </c:when>
				  </c:choose>
				</c:forEach>
			  	
				  <c:if test="${exists == 0}">
				  	<tr>
				  		<td>
							<label class="card-text" for="${tempEmployee.empID}">${tempEmployee.empID}: ${tempEmployee.firstName} ${tempEmployee.lastName} <input style="width: 15px; height: 15px; position: absolute; transform: translate(200px, -18px);"   type="checkbox" name="addEmp" value="${tempEmployee.empID}" checked></label></td>
					</tr>
				  </c:if>
				  
				  <c:if test="${exists == 1}">
				  	<tr>
				  		<td>
							<label class="card-text" for="${tempEmployee.empID}">${tempEmployee.empID}: ${tempEmployee.firstName} ${tempEmployee.lastName} <input style="width: 15px; height: 15px; position: absolute; transform: translate(200px, -18px);" type="checkbox" name="addEmp" value="${tempEmployee.empID}"></label></td>
				  	</tr>
				  </c:if>
							
			</c:forEach>
			</tbody>
			</table>
        <div class="card-text">
        	<input class="btn-form" style="width: 5rem; margin-left: 33%;" type="submit" name="save" value="Save" id="sendBtn">
        </div>      

      </form>

    </div>
		<p>
			<c:url var="projectLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTPROJECT" />
				</c:url>  
			<a class="btn btn-info" href="${projectLink}">Back to List</a>
		</p>
	</div>

 <script src="scripts/ColorTheme.js"></script>    
</body>
</html>