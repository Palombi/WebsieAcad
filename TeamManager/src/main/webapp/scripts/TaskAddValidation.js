var taskNameValidate = false;
var taskDescValidate = false;

var taskName = document.getElementById("taskName");
var taskDesc = document.getElementById("taskDesc");
var taskNameError = document.getElementById("task-name-error");
var taskDescError = document.getElementById("task-desc-error");

var colorRed = "#CC0000";

function taskAddValidation() {
	
	taskNameValidate = taskNameValidation();
	taskDescValidate = taskDescValidation();
	
	if (taskNameValidate && taskDescValidate) {
		return true;
	} else {
		return false;
	}
}

function taskNameValidation() {
	if (taskName.value !== "") {
		taskNameError.innerText = "";
		return true;
	} else {
		taskNameError.style.color = colorRed;
		taskNameError.innerText = "Please Enter A Task Name";
		return false;
	}
}

function taskDescValidation() {
	if (taskDesc.value !== "") {
		taskDescError.innerText = "";
		return true;
	} else {
		taskDescError.style.color = colorRed;
		taskDescError.innerText = "Please Enter A Task Description";
		return false;
	}
}


