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
<script type="text/javascript" src="service-worker.js"></script>
<script type="text/javascript" src="scripts/TestServiceWorker.js"></script>
<script type="text/javascript" src="scripts/Offline.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.1.min.js"> </script>
    <script type="text/javascript">
    var areWeOnline=false;
    var newEmployees = [];
    var intervalId = window.setInterval(function(){
  	  // call your function here	
  	//SEND REQUEST
  	
      var http = new XMLHttpRequest();
      http.open("GET", "http://localhost:9823/team_management/employeeControllerServlet?command=OFFLINE", true);
      http.send();
      http.onload = function() {
    	  if(newEmployees.length == 0 && (http.response=="" || http.response==" ")){
            	  console.log("Done");
    	          	window.location.href = "home.jsp";
    	          	}
    	  else if(http.response=="" || http.response==" " ){
          	document.getElementById("areYouOffline").innerHTML = "You are Online " ;
          	console.log("Fail Online");
          	areWeOnline=true;
          	if(newEmployees.length){
          		document.getElementById("sendBtn").disabled = true;
          		sendLocalstoragedEmployees()
          		document.getElementById("sendBtn").disabled = false;
          		window.location.href = "home.jsp";
          	}
          	
          }
          else{
        	  console.log("Fail");
        	  document.getElementById("areYouOffline").innerHTML = "You are Offline " ;
          	areWeOnline=false;
          }
      }
  	}, 30000);
    
    function sendLocalstoragedEmployees(){
			//TO DO ITERATE THROUGH ARRAY
			
			for (let i = 0; i < newEmployees.length; i++) {
			  //EVERY ITEM IN THE ARRAY IS AN ITEM IN LOCAL STORAGE
			  
			 
			  var tempEmp = localStorage.getItem(newEmployees[i]).split(",");
			  
			  console.log(newEmployees[i],tempEmp[0],tempEmp[1],tempEmp[2],tempEmp[3]);
			  
			  submitForm(newEmployees[i],tempEmp[0],tempEmp[1],tempEmp[2],tempEmp[3])  
			  //localStorage.removeItem(key);
			  //let lastname = localStorage.getItem(key);

			}//end of for loop
			//MAKE SURE IT SAVES AND THEN CLEAN AFTER YOURSELF
			newEmployees = [];
			localStorage.clear();
		}
    
    function getValues(){
  
    	
    	var nameEmp = document.forms["offlineForm"]["firstName"].value;
    	var lastNameEmp = document.forms["offlineForm"]["lastName"].value;
    	//password
    	var empPassword = document.forms["offlineForm"]["password"].value;
    	//gender
    	var empGender = document.forms["offlineForm"]["gender"].value;
    	//email
    	var empEmail = document.forms["offlineForm"]["email"].value;
    	
    	
    	if (nameEmp=="" || nameEmp==null){
    		alert("Please Enter your Name");
    		return false
    	}else if(lastNameEmp=="" || lastNameEmp==null)
    		alert("Please Enter your Last Name");
    	else if(empPassword=="" || empPassword==null || empPassword.lenght<8){
    		alert("A password needs to be more than 8 Characters");
    	}else if(!(empGender=="M" || empGender== "F" || empGender== "O")){
    		alert("Please input a valid Gender");
    	}
    	else{
    		
    		localStorage.setItem(nameEmp, [lastNameEmp,empPassword,empGender,empEmail]);
    		newEmployees.push(nameEmp)
    		//let lastname = localStorage.getItem(key);
    		//localStorage.removeItem(key);
    		
    		//the function below allows JS to send an employee to the back end
    		//CLEAN AFTER YOURSELF
    		
    		document.forms["offlineForm"]["firstName"].value="";
    		document.forms["offlineForm"]["lastName"].value="";
    		//password
    		document.forms["offlineForm"]["password"].value="";
	    	//gender
	    	document.forms["offlineForm"]["gender"].value="";
	    	//email
	    	document.forms["offlineForm"]["email"].value="";
	    	}//	END OF THE ELSE STATEMENT
	    	
    	
    }
    
    
    function submitForm(nameEmp,lastNameEmp,empPassword,empGender,empEmail) {
    	//TO DO
    	
    	//PREPARE URL STRING 
    	var parameterString = "nameEmp="+nameEmp+"&lastNameEmp="+lastNameEmp+"&empPassword="+empPassword+"&empGender="+empGender+"&empEmail="+empEmail;
    	
    	//SEND REQUEST
        var http = new XMLHttpRequest();
        http.open("GET", "http://localhost:9823/team_management/employeeControllerServlet?command=OFFLINE&"+parameterString, true);
        http.send();
        http.onload = function() {
            alert(http.responseText);
            console.log(http.response);
            if(http.response=="" || http.response==""){
            	document.getElementById("areYouOffline").innerHTML = "You are Online " ;
            }else{
            	document.getElementById("areYouOffline").innerHTML = "You are Offline " ;
            }
        }
        }
    //http://localhost:9823/team_management/employeeControllerServlet?command=ADDCLIENT&clientName=AppleSoft2&clientAddress=327+Guildford+Road%2C+Guildford+NSW%2C+Australia&clientEmail=chappy4986%40gmail.com&clientID=&save=Save
    
    
    </script>


<style>
.circle-image {
	filter: invert(40%);
}
</style>
</head>

<body>

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
				<li><span id="status"></span></li>
			</ul>
		
		</form>
		<!-- nav section end -->

	<div  class="card" style="text-align:center; box-shadow: rgba(0, 0, 0, 0.5) 2px 2px 2px 1px;height:40rem; background: rgb(255, 255, 255); margin: 5rem; color: rgb(0, 0, 0);">

			<h2 class="card-footer" style="color: rgb(0, 0, 0);">Offline Page</h2>


			<div style="height: 24rem;" >
			<p id="areYouOffline">You are offline</p>
			<p>This page will allow you to add Employees even if you loose connection. We will notify you as soon as you get your connection back up.</p>
			
		
			
			<div class="card-text" style="color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
				
			<form name="offlineForm">
			First Name<input type="text" name="firstName" >
			Last Name<input type="text" name="lastName" >
			Password<input type="text" name="password" >
			Email<input type="text" name="email" >
			<p>Gender</p>
			<select class="card-text" name = "gender"  class="drop" style="height: 50px; display: block;  margin-bottom: 10px; 
			 width: 100%; border: 2px solid #2980B9; font-size: 18px; border-radius: 5px; padding:10px;">
		            <option  class="drop" value="M" selected>Male </option>
		            <option  class="drop" value="F">Female</option>
		            <option class="drop" value="O">Other</option>
		         </select>
        		
			<input class="btn-form" style="width: 5rem; margin-left: 45%; color: rgb(0, 0, 0);
			 background-color: rgb(255, 255, 255);" type="button" value="Submit"  onclick="getValues()"  id="sendBtn">
			</form>
			
			</div>	</div>


		</div>

	</div>
	<script src="scripts/ColorTheme.js"></script>
	   

</body>

</html>
