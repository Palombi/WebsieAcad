var myVar = window.location.href;
if (myVar.includes("employeeControllerServlet?command=LISTCLIENT") == false){
	window.location.replace("employeeControllerServlet?command=LISTCLIENT");
}