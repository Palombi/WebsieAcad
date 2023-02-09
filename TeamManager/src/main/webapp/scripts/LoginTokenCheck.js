let x = document.cookie;
console.log(x);
if (x !== "login=true"){
	location.href = "/team_management/employeeControllerServlet";
}

function deleteCookie(){
	document.cookie = "login=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}