var isTheNameValidated= false;
var isTheStartDateValidated=false;
var isTheEndDateValidated=false;

var nameProject = document.getElementsByName("nameProject");
var startDate = document.getElementById("startDate");
var endDate = document.getElementById("endDate");

var ProjectNameError = document.getElementById("project-name-error");
var ProjectStartDateError = document.getElementById("project-start-date-error");
var ProjectEndDateError = document.getElementById("project-end-date-error");

var colorRed = "#CC0000";



	

function ProjectAddValidation() 
{
	
isTheNameValidated = NameValidation();
isTheStartDateValidated = StartDateValidation();	
isTheEndDateValidated = EndDateValidation();


if (isTheNameValidated==true&&isTheStartDateValidated==true&&isTheEndDateValidated==true){
	return true;
}else{
	return false;	
}

}



function NameValidation(){
	if (nameProject[0].value !==""){
	ProjectNameError.innerText = "";
	return true;
}else{
	ProjectNameError.style.color = colorRed;
	ProjectNameError.innerText = "Error Please Insert a Valid Name";
	return false;
}}

function StartDateValidation()
{
	
	if(startDate.value !=="" ){
		ProjectStartDateError.innerText = "";
		return true;
	}else{
		ProjectStartDateError.style.color = colorRed;
		ProjectStartDateError.innerText = "Error Please insert a Valid Start Date";
		return false;
	}}
	
function EndDateValidation(){
	var startDate1 = new Date(startDate.value);
	var endDate1 = new Date(endDate.value);
	if(endDate.value !== "" && startDate1 < endDate1 ){
		ProjectEndDateError.innerText = "" ; 
		return true;
	}else{
		ProjectEndDateError.style.color = colorRed;
		ProjectEndDateError.innerText = "Error Please Insert a Valid End Date" ; 
		return false;
	}
}