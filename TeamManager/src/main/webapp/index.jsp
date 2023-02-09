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
    <link rel="stylesheet" href="css/main.css" />
    
    <style>
    ::-ms-reveal {
  		filter: invert(45%);
	}
    </style>
    <script type="text/javascript" src="scripts/TestServiceWorker.js"></script>
  </head>

  <body style="background-color: #EFEFEF;">
  

    <div class="container" style="background-color: transparent;">
    
    <c:set var="empEmails" value="${EMP_EMAILS}"  />
    <c:set var="empPasswords" value="${EMP_PASS}"  />
    <c:set var="Invalid" value="${invalid}" />
    
    <div class="welcome" id="welcome" style="display: flex; flex-direction: column; align-items: center; background-color: transparent;">
    <img src="images/hero-image.png" class="d-block w-80" alt="welcome" style="height: 70vh;">
    
      <form
    	action="employeeControllerServlet"
    	method="post"
    	onsubmit="return validateForm()"
    	>
    	
    <div style="width: 36rem; margin-top: -4rem;">
    
    <label>Email:</label>
    <input
    	name="emailValue"		
	    type="email"
	    id="typeEmailX-2"
	    class="form-control form-control-lg"
  	/>
        
        <br/>

    <label>Password:</label><input type="password"
    		name="passwordValue"
		     id="typePasswordX-2"
		     class="form-control form-control-lg"/>
	
	<div style="display: flex; justify-content: center; align-items: center;">
		<input type="radio" value="light" name="color-theme" id="light" style="padding: 1rem;" checked/>
		<label for="light" style="padding: 1rem;">Light Theme</label>
		<input type="radio" value="dark" name="color-theme" id="dark" style="padding: 1rem;"/>
		<label for="dark" style="padding: 1rem;">Dark Theme</label>
	</div>
	</div>
    <input
			id="loginBtn"
           class="btn btn-dark btn-lg"
           type="submit"
           value="Enter"
           style="margin-left: 45%;"
         />  
    </form>
                  
                  
                  
    </div>
    </div>
    <c:set var="invalid" value='${invalid}' />
    <script src="scripts/SetColorTheme.js"></script>
    <script>
    
    var login = '${invalid}';
    if (login == "Wrong Information!"){
    	alert(login);
    }
    var colorTheme;
    
    const radios = document.getElementsByName("color-theme");

    for (const radio in radios) {
    	radios[radio].onclick = function() {
    		colorTheme = this.value;
    		sessionStorage.setItem("colorTheme", colorTheme);
    		var elements = document.getElementsByTagName("*");
    		var loginInput = document.getElementsByClassName("form-control form-control-lg");
    		var loginButton = document.getElementById("loginBtn");
    		var welcome = document.getElementById("welcome");
    		
    		if (this.value == "dark") {
    			for (var p = 0; p < elements.length; p++) {
    				elements[p].style.color = color12;
    				elements[p].style.backgroundColor = color11;
    				for (var w = 0; w < loginInput.length; w++) {
    					loginInput[w].style.backgroundColor = color11;
    				}
    			}
    			document.body.style.backgroundColor = color11;
    		} else {
    			for (var b = 0; b < elements.length; b++) {
    				elements[b].style.color = color2;
    				elements[b].style.backgroundColor = color1;
    				loginButton.style.backgroundColor = "#343a40";
    				loginButton.style.color = color3;
    				for (var w = 0; w < loginInput.length; w++) {
    					loginInput[w].style.backgroundColor = "#ffffff";
    				}
    			}
    			document.body.style.backgroundColor = color1;
    		}
    	}
    }
       
	var element = document.getElementById("loginBtn");
	
	var invalid = '${Invalid}';
	
      	function validateForm() {
     	  
    var userEmail = document.getElementById("typeEmailX-2");
    var userPassword = document.getElementById("typePasswordX-2");
      
    var i = 0;
   	var count = 1;
   	var lowerUserEmail = userEmail.value.toLowerCase(); 
   	   
    	if (lowerUserEmail !== "" && userPassword.value !== "") {
       		console.log("true");
       		return true;
       	} else {
       		console.log("false");
       		return false;
       	}
      
      }
                  
    </script>
  </body>
</html>
