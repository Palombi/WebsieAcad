var myVar = window.location.href;
if (myVar.includes("employeeControllerServlet?command=LISTPROJECT") == false){
	window.location.replace("employeeControllerServlet?command=LISTPROJECT");
}