var myVar = window.location.href;
if (myVar.includes("employeeControllerServlet?command=LISTTASK") == false){
	window.location.replace("employeeControllerServlet?command=LISTTASK");
}