var myVar = window.location.href;
if (myVar.includes("employeeControllerServlet?command=LISTEMPLOYEE") == false){
	window.location.replace("employeeControllerServlet?command=LISTEMPLOYEE");
}