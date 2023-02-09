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
<script src="scripts/EmployeeLocationReplace.js"></script>  
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

      <!-- button section start -->
      <div class="top" style="display: flex; justify-content: center; align-items: center;">
      <div class="btnTools">
        <button type="button" id="add-employee" onClick="window.location.href='EmployeeTestAdd.jsp'" class="btn btn-info">
          ADD
        </button>
      </div>
      <input class="card-text" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search" style="width: 214px;">
      </div>
      <!-- button section end -->
      
      <!-- expanded section start -->
      <table id="myTable" style="border-collapse: collapse; width: 100%;">
      		<c:forEach var = "tempEmp" items="${EMP_LIST}">
				<!-- set up link to delete a student -->	
				<c:url var="deleteLink" value="employeeControllerServlet">
				<c:param name="command" value="DELETEEMPLOYEE" />
				<c:param name="employeeID" value="${tempEmp.empID}" />
				</c:url>  
				<c:url var="updateLink" value="employeeControllerServlet">
        		<c:param name ="command" value = "LOADEMPLOYEE" />
        		<c:param name="employeeId" value="${tempEmp.empID}" />
        		</c:url>				
      			<tr>
      			<td>
		      <div class="card" style="box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5); margin-bottom: 30px;">
		  	<div class="card-header">
		    	${tempEmp.firstName} ${tempEmp.lastName}
		  	</div>
		  	<div class="card-body">
		  	<img 
		  	src="images/user.png"
		  	alt="Avatar"
		  	class="img-fluid my-5"
		  	style="width: 80px"
		  	/>
		    <div class="deets">
		     <table class="table">
		      <tr>
		       <th scope="col">Gender</th>
		        <th scope="col">Email</th>
		      </tr>
		       <tr class="table-rows">
		        <th scope="row" style="font-weight: 300;">${tempEmp.gender}</th>
		         <th scope="row" style="font-weight: 300;">${tempEmp.email}</th>
		      </table>
		     </div>
		    <div class="links">
		   <a class="footer-links" href="${updateLink}">Update</a> | 
			<a class="footer-links" href="${deleteLink}"onclick="if (!(confirm('Are you sure you want to delete this Employee?')))return false">
			 Delete</a>
			</div>
		   </div>
		  </div>
		</td>
	</tr>
</c:forEach> 
</table>
      
      <!-- expanded section end -->

    </div>
    <script src="scripts/TableSearch.js"></script>
    <script src="scripts/ColorTheme.js"></script>
  </body>
</html>