var colorTheme = sessionStorage.getItem("colorTheme");
var color1 = sessionStorage.getItem("color1");
var color2 = sessionStorage.getItem("color2");
var color3 = sessionStorage.getItem("color3");
var bodyColor = sessionStorage.getItem("bodyColor");
var linkColor = sessionStorage.getItem("linkColor");
var quickLinkColor = sessionStorage.getItem("quickLinkColor");
var color11 = sessionStorage.getItem("color11");
var color12 = sessionStorage.getItem("color12");
var color13 = sessionStorage.getItem("color13");

var elements = document.getElementsByTagName("*");
var cards = document.getElementsByClassName("card");
var cardBodys = document.getElementsByClassName("card-body");
var cardBodysTask = document.getElementsByClassName("card-body-task");
var cardBodyTitle = document.getElementsByClassName("card-title");
var cardBodyText = document.getElementsByClassName("card-text");
var cardContentTask = document.getElementsByClassName("card-content-task");
var cardFooter = document.getElementsByClassName("card-footer");
var cardHeader = document.getElementsByClassName("card-header");
var bannerText = document.getElementsByClassName("banner-text");
var buttonsPrimary = document.getElementsByClassName("btn btn-primary");
var buttonsInfo = document.getElementsByClassName("btn btn-info");
var cardImage = document.getElementsByClassName("card-img-top");
var navLink = document.getElementsByClassName("nav-link");
var quickLinks = document.getElementsByClassName("quick-links");
var footerLinks = document.getElementsByClassName("footer-links");
var buttonsForm = document.getElementsByClassName("btn-form");


if (colorTheme == "dark") {
	for (var p = 0; p < elements.length; p++) {
		elements[p].style.color = color12;
		//elements[p].style.backgroundColor = color11;
	}
	for (var w = 0; w < cards.length; w++){
		cards[w].style.backgroundColor = color13;
	}
	if (cardBodys.length > 0){
		for (var w = 0; w < cardBodys.length; w++) {
			cardBodys[w].style.backgroundColor = color11;
		}
	}
	if (cardBodysTask.length > 0){
		for (var w = 0; w < cardBodysTask.length; w++) {
			cardBodysTask[w].style.backgroundColor = color11;
		}
	}
	if (cardBodyTitle.length > 0){
		for (var w = 0; w < cardBodyTitle.length; w++) {
			cardBodyTitle[w].style.backgroundColor = color11;
		}
	}
	if (cardBodyText.length > 0){
		for (var w = 0; w < cardBodyText.length; w++) {
			cardBodyText[w].style.backgroundColor = color11;
		}
	}
	if (cardContentTask.length > 0){
		for (var w = 0; w < cardContentTask.length; w++) {
			cardContentTask[w].style.backgroundColor = color11;
		}
	}
	if (cardFooter.length > 0){
		for (var w = 0; w < cardFooter.length; w++) {
			cardFooter[w].style.backgroundColor = color11;
		}
	}
	if (cardHeader.length > 0){
		for (var w = 0; w < cardHeader.length; w++) {
			cardHeader[w].style.backgroundColor = color11;
			cardHeader[w].style.borderBottom = "1px solid white";
		}
	}
	if (bannerText.length > 0){
		for (var w = 0; w < bannerText.length; w++) {
			bannerText[w].style.color = color1;
		}
	}
	if (buttonsPrimary.length > 0){
		for (var w = 0; w < buttonsPrimary.length; w++) {
			buttonsPrimary[w].style.backgroundColor = color11;
		}
	}
	if (buttonsInfo.length > 0){
		for (var w = 0; w < buttonsInfo.length; w++) {
			buttonsInfo[w].style.backgroundColor = color11;
		}
	}
	if (cardImage.length > 0){
		for (var w = 0; w < cardImage.length; w++) {
			cardImage[w].style.backgroundColor = color3;
		}
	}
	if (buttonsForm.length > 0){
		for (var w = 0; w < buttonsForm.length; w++) {
			buttonsForm[w].style.backgroundColor = color11;
		}
	}
	document.body.style.backgroundColor = color11;
} else {
	for (var b = 0; b < elements.length; b++) {
		elements[b].style.color = color2;
		//elements[b].style.backgroundColor = color1;
	}
	for (var q = 0; q < cards.length; q++){
		cards[q].style.backgroundColor = color3;
	}
	if (cardBodys.length > 0){
		for (var w = 0; w < cardBodys.length; w++) {
			cardBodys[w].style.backgroundColor = color3;
		}
	}
	if (cardBodysTask.length > 0){
		for (var w = 0; w < cardBodysTask.length; w++) {
			cardBodysTask[w].style.backgroundColor = color3;
		}
	}
	if (cardBodyTitle.length > 0){
		for (var w = 0; w < cardBodyTitle.length; w++) {
			cardBodyTitle[w].style.backgroundColor = color3;
		}
	}
	if (cardBodyText.length > 0){
		for (var w = 0; w < cardBodyText.length; w++) {
			cardBodyText[w].style.backgroundColor = color3;
		}
	}
	if (cardContentTask.length > 0){
		for (var w = 0; w < cardContentTask.length; w++) {
			cardContentTask[w].style.backgroundColor = color3;
		}
	}
	if (cardFooter.length > 0){
		for (var w = 0; w < cardFooter.length; w++) {
			cardFooter[w].style.color = color2;
		}
	}
	if (cardHeader.length > 0){
		for (var w = 0; w < cardHeader.length; w++) {
			cardHeader[w].style.backgroundColor = color3;
			cardHeader[w].style.borderBottom = "1px solid black";
		}
	}
	if (bannerText.length > 0){
		for (var w = 0; w < bannerText.length; w++) {
			bannerText[w].style.color = color1;
		}
	}
	if (buttonsPrimary.length > 0){
		for (var w = 0; w < buttonsPrimary.length; w++) {
			buttonsPrimary[w].style.backgroundColor = color3;
		}
	}
	if (buttonsInfo.length > 0){
		for (var w = 0; w < buttonsInfo.length; w++) {
			buttonsInfo[w].style.backgroundColor = color3;
		}
	}
	if (cardImage.length > 0){
		for (var w = 0; w < cardImage.length; w++) {
			cardImage[w].style.backgroundColor = color3;
		}
	}
	if (navLink.length > 0){
		for (var w = 0; w < navLink.length; w++) {
			navLink[w].style.color = color12;
		}
	}
	if (quickLinks.length > 0){
		for (var w = 0; w < quickLinks.length; w++) {
			quickLinks[w].style.color = quickLinkColor;
		}
	}
	if (footerLinks.length > 0){
		for (var w = 0; w < footerLinks.length; w++) {
			footerLinks[w].style.color = linkColor;
		}
	}
	if (buttonsForm.length > 0){
		for (var w = 0; w < buttonsForm.length; w++) {
			buttonsForm[w].style.color = color2;
			buttonsForm[w].style.backgroundColor = color3;
		}
	}
	document.body.style.backgroundColor = color1;
}