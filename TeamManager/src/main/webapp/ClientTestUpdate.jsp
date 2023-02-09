<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<title>Update Client(test)</title>
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
	
	<div id="container"> </div>
	
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
            <a class="nav-link active" href="${clientLink}">Clients</a>
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
            <a class="nav-link" href="${projectLink}">Projects</a>
          </li>
        </ul>
      </form>
      <!-- nav section end -->
	
		
		
		<form class="card" style="box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5); margin-top: 5rem; margin: 5rem;" action="employeeControllerServlet" method="GET">
		<h3 class="card-footer">Update Client</h3>
		
			<input type="hidden" name="command" value="UPDATECLIENT" />

			<input type="hidden" name="clientID" value="${CLIENT.clientID}" />
			
			<table class="card-text">
					<tr>
					<td><label></label></td>
					</tr>
					
					<tr>
						<td style="width: 10rem;"><label class="card-text" style="margin-left: 10%;">Client Name:</label></td>
						<td><input class="card-text" type="text" name="clientName" 
								   value="${CLIENT.clientName}" style="width: 90%; padding:10px;" /></td>
					</tr>
					<tr>
					<td><label></label></td>
					</tr>
					<tr>
						<td><label class="card-text" style="margin-left: 10%;">Client Address:</label></td>
						<td><input class="card-text" type="text" name="clientAddress" ID="address"
								   value="${CLIENT.clientAddress}" style="width: 90%; padding:10px;" /></td>
				 
					</tr>
					<tr>
					<td><label></label></td>
					</tr>
					<tr>
						<td><label class="card-text" style="margin-left: 10%;">Client Email:</label></td>
						<td><input class="card-text" type="text" name="clientEmail"  
								   value="${CLIENT.clientEmail}" style="width: 90%; padding:10px;" /></td>
					</tr>
					
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGT1dAe1xP9Db3YIgme8rlEhmxrWCN7UQ&type=adresses&libraries=places&callback=initAutocomplete" async defer>
				        </script>
				        <script>
				       let autocomplete;
				       function initAutocomplete() {
				           autocomplete = new google.maps.places.Autocomplete(
				                   document.getElementById('address'),
				                   {
				                       types: ['establishment' | 'geocode'],
				                       componentRestrictions: {'country': ['AU']},
				                       fields: ['place_id', 'geometry', 'name']
				                   });
				       }
				       </script>
					
					<tr>
					<td><label></label></td>
					</tr>
					<tr>
						<td><label class="card-text" style="margin-left: 10%;"></label></td>
						<td><button type="submit" value="Save" class="m-2 btn btn-info" />Save</button></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		
		<div style="clear: both;"></div>
		
		<p>
		<c:url var="clientLink" value="employeeControllerServlet">
			<c:param name="command" value="LISTCLIENT" />
		</c:url>
			<div class="btnTools">
		<button type="button" class="btn btn-info" onclick="window.location.href='${clientLink}'">
		<a href="${clientLink}">Go To Client List</a>
		</button>
	</div>
	</p>
	
	<script src="scripts/ColorTheme.js"></script>		
</body>
</html>









