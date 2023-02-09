var clientNameValidate = false;
var clientAddressValidate = false;
var clientEmailValidate = false;

var clientName = document.getElementById("client-name");
var clientAddress = document.getElementById("client-address");
var clientEmail = document.getElementById("client-email");
var clientNameError = document.getElementById("client-name-error");
var clientAddressError = document.getElementById("client-address-error");
var clientEmailError = document.getElementById("client-email-error");

var colorRed = "#CC0000";

function clientAddValidation() {
	
	clientNameValidate = clientNameValidation();
	clientAddressValidate = clientAddressValidation();
	clientEmailValidate = clientEmailValidation();
	
	if (clientNameValidate && clientAddressValidate && clientEmailValidate) {
		return true;
	} else {
		return false;
	}
}

function clientNameValidation() {
	if (clientName.value !== "") {
		clientNameError.innerText = "";
		return true;
	} else {
		clientNameError.style.color = colorRed;
		clientNameError.innerText = "Please Enter A Client Name";
		return false;
	}
}

function clientAddressValidation() {
	if (clientAddress.value !== "") {
		clientAddressError.innerText = "";
		return true;
	} else {
		clientAddressError.style.color = colorRed;
		clientAddressError.innerText = "Please Enter A Client Address";
		return false;
	}
}

function clientEmailValidation() {
	if (clientEmail.value !== "") {
		clientEmailError.innerText = "";
		return true;
	} else {
		clientEmailError.style.color = colorRed;
		clientEmailError.innerText = "Please Enter A Client Email";
		return false;
	}
}