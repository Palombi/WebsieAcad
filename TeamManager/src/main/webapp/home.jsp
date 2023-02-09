<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Team Management</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
	<link rel="stylesheet" src="css/Offline.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@300;400;700&display=swap"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="css/style.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="scripts/TestServiceWorker.js"></script>
<script type="text/javascript" src="scripts/Offline.js"></script>

  <script>
  
	if ('serviceWorker' in navigator) {
		  // Register a service worker hosted at the root of the
		  // site using the default scope.
		  navigator.serviceWorker.register('ServiceWorkerTest.js').then((registration) => {
		    console.log('Service worker registration succeeded:', registration);
		  }, /*catch*/ (error) => {
		    console.error(`Service worker registration failed: ${error}`);
		  });
		} else {
		  console.error('Service workers are not supported.');
		}
  
  </script>


<style>
.circle-image {
	filter: invert(40%);
}
</style>
</head>

<body>
	<script src="scripts/LoginTokenCheckHome.js"></script>
	<c:set var="didLogin" value='${pass}' />
	<script>
var login = '${pass}';
let x = document.cookie;
if (x !== "login=true"){
	if (login === "true") {
		setCookie("login", "true", 365);	
	} else {
		location.href = "/team_management/employeeControllerServlet";
	}
}
	


</script>

	<div class="container">
		<!-- nav section start-->
		<form class="form-inline">
			<ul class="nav justify-content-center">
				<li class="nav-item"><c:url var="loginLink"
						value="employeeControllerServlet">
						<c:param name="command" value="LOGINPAGE" />
					</c:url> <a class="nav-link" href="${loginLink}" onclick="deleteCookie()">Logout</a>
				</li>
				<li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a>
				</li>
				<li class="nav-item"><c:url var="clientLink"
						value="employeeControllerServlet">
						<c:param name="command" value="LISTCLIENT" />
					</c:url> <a class="nav-link" href="${clientLink}">Clients</a></li>
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
				
			</ul>
		
		</form>
		<!-- nav section end -->

		<!-- carousel section start -->
		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="false">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/telstra.jpg" class="d-block w-100" alt="telstra"
						style="height: 500px;">

					<div class="carousel-caption d-none d-md-block">
						<h5 class="banner-text"
							style="color: #f5f5f5; font-weight: bold; font-size: 40px;">Telstra</h5>
						<p></p>
					</div>
				</div>
			</div>



				<div class="carousel-item">
					<img src="images/woolworths.jpg" class="d-block w-100"
						alt="woolworths" style="height: 500px;">
					<div class="carousel-caption d-none d-md-block">
						<h5 class="banner-text"
							style="color: #f5f5f5; font-weight: bold; font-size: 40px;">Woolworths</h5>
						<p></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="images/7west.jpg" class="d-block w-100" alt="7west"
						style="height: 500px;">
					<div class="carousel-caption d-none d-md-block">
						<h5 class="banner-text"
							style="color: #f5f5f5; font-weight: bold; font-size: 40px;">7
							West</h5>
						<p></p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<div class="quick-links"
			style="display: flex; justify-content: center; z-index: 999;">
			<p class="quick-links"
				style="display: flex; justify-content: center; align-items: center; margin-right: 5px; color: #777DA7; font-family: Calibri; font-size: 20px; text-decoration: underline;">Quick</p>
			<img src="images/circle-button.png" class="circle-image"
				alt="scroll down"
				style="height: 60px; margin: 5px; text-shadow: 4px 4px 0px rgba(0, 0, 0, 0.1);">
			<p class="quick-links"
				style="display: flex; justify-content: center; align-items: center; margin-left: 5px; color: #777DA7; font-family: Calibri; font-size: 20px; text-decoration: underline;">Links</p>
		</div>
		<!-- carousel section end -->

		<!-- scroll start -->

		<!-- scroll down -->

		<!-- card section start -->
		<div class="cards">
			<div class="card"
				style="width: 18rem; margin: 2px; box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5);">
				<img class="card-img-top" src="images/client.png"
					alt="Card image cap" style="height: 12rem" />
				<div class="card-body">
					<h5 class="card-title">Clients</h5>
					<p class="card-text">Meet the clients.</p>
					<c:url var="clientLink" value="employeeControllerServlet">
						<c:param name="command" value="LISTCLIENT" />
					</c:url>
					<a href="${clientLink}" class="btn btn-primary">Go to clients</a>
				</div>
			</div>
			<div class="card"
				style="width: 18rem; margin: 2px; box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5);">
				<img class="card-img-top" src="images/report.png"
					alt="Card image cap" style="height: 12rem" />
				<div class="card-body">
					<h5 class="card-title">Tasks</h5>
					<p class="card-text">View current tasks.</p>
					<c:url var="taskLink" value="employeeControllerServlet">
						<c:param name="command" value="LISTTASK" />
					</c:url>
					<a href="${taskLink}" class="btn btn-primary">Go to tasks</a>
				</div>
			</div>
			<div class="card"
				style="width: 18rem; margin: 2px; box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5);">
				<img class="card-img-top" src="images/skills.png"
					alt="Card image cap" style="height: 12rem" />
				<div class="card-body">
					<h5 class="card-title">Employees</h5>
					<p class="card-text">Meet the team.</p>
					<c:url var="employeeLink" value="employeeControllerServlet">
						<c:param name="command" value="LISTEMPLOYEE" />
					</c:url>
					<a href="${employeeLink}" class="btn btn-primary">Go to
						employees</a>
				</div>
			</div>
			<div class="card" id="homeCard"
				style="width: 18rem; margin: 2px; box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.5);">
				<img class="card-img-top" src="images/tools.png"
					alt="Card image cap" style="height: 12rem" />
				<div class="card-body">
					<h5 class="card-title">Projects</h5>
					<p class="card-text">See whats on.</p>
					<c:url var="projectLink" value="employeeControllerServlet">
						<c:param name="command" value="LISTPROJECT" />
					</c:url>
					<a href="${projectLink}" class="btn btn-primary">Go to projects</a>
				</div>
			</div>
		</div>
		<!-- card section end -->
	</div>
	<script src="scripts/ColorTheme.js"></script>
	
</body>

</html>
