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

    <form action="employeeControllerServlet" method="GET" class="card" style="box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5); margin-top: 5rem;">
    	<input type ="hidden" name="command" value="ADDEMPLOYEE">

        <h2 class="card-footer">Employee Details</h2>
        <table class="card-text" style="border-collapse: seperate !important; border-spacing: 0 2rem;">
        <tbody>
        	<tr>
			<td><label></label></td>
			</tr>
        	<tr>
        		<td><label class="card-text" style="margin-left: 10%; padding:10px;" for="first-name">First Name</label></td>
        		<td><input class="card-text" type="text" name="firstName" id="first-name" style="width: 90%; padding:10px;"></td>
        	</tr>
			<tr>
			<td><label></label></td>
			</tr>
        	<tr>
				<td><label class="card-text" style="margin-left: 10%; padding:10px;" for="last-name">Last Name</label></td>
        		<td><input class="card-text" type="text" name="lastName" id="last-name" style="width: 90%; padding:10px;"></td>
        	</tr>
			<tr>
			<td><label></label></td>
			</tr>
        	<tr>
				<td><label class="card-text" style="margin-left: 10%; padding:10px;" for="password">Password</label></td>
        		<td><input class="card-text" type="text" name="passWord" id="password" style="width: 90%; padding:10px;"></td>
        	</tr>
			<tr>
			<td><label></label></td>
			</tr>
        	<tr>
				<td><label class="card-text" style="margin-left: 10%; padding:10px;" for="gender">Gender</label></td>
        		<td><select class="card-text" name = "gender"  class="drop" style="height: 50px; display: block;  margin-bottom: 10px;  width: 90%; border: 2px solid #2980B9; font-size: 18px; border-radius: 5px; padding:10px;">
		            <option  class="drop" value="M" selected>Male </option>
		            <option  class="drop" value="F">Female</option>
		            <option class="drop" value="O">Other</option>
		         </select>
        		</td>
        	</tr>
			<tr>
			<td><label></label></td>
			</tr>
        	<tr>
				<td><label class="card-text" style="margin-left: 10%; padding:10px;" for="email">Email</label></td>
        		<td><input class="card-text" type="email" id="email" name="email" style="width: 90%; padding:10px;">
        		</td>
        	</tr>
        	<tr>
			<td><label></label></td>
			</tr>
        </tbody>
        </table>
		<div class="card-text">
			<input class="btn-form" style="width: 5rem; margin-left: 45%; padding:10px;" type="submit" name="save" value="Save" id="sendBtn">
		</div>
        
      </form>
    </div>

		<p>
			<c:url var="employeeLink" value="employeeControllerServlet">
				<c:param name="command" value="LISTEMPLOYEE" />
				</c:url>  
				<div class="btnTools">
			<button type="button" class="btn btn-info" onclick="window.location.href='${employeeLink}'">
			<a href="${employeeLink}">Back to List</a>
			</button>
	</div>
		</p>
<script src="scripts/ColorTheme.js"></script>    
</body>
</html>