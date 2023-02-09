function setCookie(cname, cvalue, exdays) {
	  const d = new Date();
	  d.setTime(d.getTime() + (exdays*24*60*60*1000));
	  let expires = "expires="+ d.toUTCString();
	  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function deleteCookie(){
	document.cookie = "login=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}
