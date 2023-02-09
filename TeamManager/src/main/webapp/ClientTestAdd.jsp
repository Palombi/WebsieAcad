<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Form</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
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
				<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a>
				</li>
				<li class="nav-item"><c:url var="clientLink"
						value="employeeControllerServlet">
						<c:param name="command" value="LISTCLIENT" />
					</c:url> <a class="nav-link active" href="${clientLink}">Clients</a></li>
				<li class="nav-item"><c:url var="taskLink"
						value="employeeControllerServlet">
						<c:param name="command" value="LISTTASK" />
					</c:url> <a class="nav-link" href="${taskLink}">Tasks</a></li>
				<li class="nav-item"><c:url var="employeeLink"
						value="employeeControllerServlet">
						<c:param name="command" value="LISTEMPLOYEE" />
					</c:url> <a class="nav-link" href="${employeeLink}">Employees</a></li>
				<li class="nav-item"><c:url var="projectLink"
						value="employeeControllerServlet">
						<c:param name="command" value="LISTPROJECT" />
					</c:url> <a class="nav-link" href="${projectLink}">Projects</a></li>
				<li class="nav-item"><c:url var="projectLink"
						value="employeeControllerServlet">
						<c:param name="command" value="LISTPROJECT" />
					</c:url> <a class="nav-link" href="${projectLink}">Projects</a></li>
			</ul>
		</form>
		<!-- nav section end -->







		<form action="employeeControllerServlet" method="GET"
			onsubmit="return clientAddValidation()" class="card"
			style="box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5); margin-top: 5rem; background: white; margin: 5rem;">
			<input type="hidden" name="command" value="ADDCLIENT">

			<h2 class="card-footer">Add Client</h2>

			<table class="card-text"
				style="border-collapse: seperate !important; border-spacing: 0 2rem;">
				<tbody>
					<tr>
						<td><label></label></td>
						<td><span id="client-name-error" class="error"></span></td>
					</tr>

					<tr>
						<td><label class="card-text" style="margin-left: 10%;"
							for="client-name">Client Name</label></td>
						<td><input class="card-text" type="text" name="clientName"
							id="client-name" style="width: 90%; padding: 10px;"></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><span id="client-address-error" class="error"></span></td>
					</tr>

					<tr>
						<td><label class="card-text" style="margin-left: 10%;"
							for="client-address">Client Address</label></td>
						<td><input class="card-text" type="text" name="clientAddress"
							id="client-address" style="width: 90%; padding: 10px;"></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><span id="client-email-error" class="error"></span></td>
					</tr>

					<tr>
						<td><label class="card-text" style="margin-left: 10%;"
							for="client-email">client Email</label></td>
						<td><input class="card-text" type="text" name="clientEmail"
							id="client-email" style="width: 90%; padding: 10px;"></td>
					</tr>

					<tr>
						<td><label></label></td>
					</tr>

				</tbody>
			</table>
			<input type="hidden" name="clientID" id="empID">

			<script
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGT1dAe1xP9Db3YIgme8rlEhmxrWCN7UQ&type=adresses&libraries=places&callback=initAutocomplete"
				async defer>
				
			</script>
			<script>
				let autocomplete;
				function initAutocomplete() {
					autocomplete = new google.maps.places.Autocomplete(document
							.getElementById('client-address'), {
						types : [ 'geocode' ],
						componentRestrictions : {
							'country' : [ 'AU' ]
						},
						fields : [ 'place_id', 'geometry', 'name' ]
					});
				}
			</script>
			<div class="card-text">
				<input class="btn-form" style="width: 5rem; margin-left: 45%;"
					type="submit" name="save" value="Save" id="sendBtn">
			</div>


		</form>
	</div>
	<c:catch var="catchtheException">
		<c:url var="clientLink" value="employeeControllerServlet">
			<c:param name="command" value="LISTCLIENT" />
		</c:url>
	</c:catch>

	<c:if test="${catchtheException != null}">
		<p>
			The type of exception is : ${catchtheException} <br /> There is an
			exception: ${catchtheException.message}
		</p>
	</c:if>

	<button onclick="window.location.href='${clientLink}'"
		class="btn btn-info">
		<a class="link" href="${clientLink}">Go Back to list</a>
	</button>

	</div>
	<script>
		//<c:set var="invalid" value='${invalid}' />

		//var login = '${invalid}';
	</script>
	<script src="scripts/ClientAddValidation.js"></script>
	<script src="scripts/ColorTheme.js"></script>
</body>
</html>