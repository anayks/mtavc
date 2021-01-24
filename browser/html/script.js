let sexState = 1;

function myScript() {
	document.getElementById("malecont").style.backgroundColor = "#38f";
	document.getElementById("male").style.background = "url(\"images/male_active.png\") no-repeat";
	document.getElementById("male").style.backgroundSize = "cover"
	document.getElementById("fem").style.backgroundSize = "cover"
}

function femin() {
	document.getElementById("femcont").style.backgroundColor = "#f7e";
	document.getElementById("fem").style.background = "url(\"images/female_active.png\") no-repeat";
	document.getElementById("fem").style.backgroundSize = "cover"
	document.getElementById("male").style.backgroundSize = "cover"
}

function femout() 
{
	if(sexState == 1 || sexState == 0) 
	{
		document.getElementById("femcont").style.backgroundColor = "#eee";
		document.getElementById("fem").style.background = "url(\"images/female_no_active.png\") no-repeat";
		document.getElementById("fem").style.backgroundSize = "cover"
		document.getElementById("male").style.backgroundSize = "cover"
	}
}

function myScriptOut() {
	if(sexState == 0 || sexState == 2) 
	{
		document.getElementById("malecont").style.backgroundColor = "#eee";
		document.getElementById("male").style.background = "url(\"images/male_no_active.png\") no-repeat";
		document.getElementById("fem").style.backgroundSize = "cover"
		document.getElementById("male").style.backgroundSize = "cover"
	}
}

function chooseSpawn() {
	mta.triggerEvent("chooseSpawn")
}

function randomVn() {
	mta.triggerEvent("randomVn")
}

function leftPerson() {
	mta.triggerEvent("leftPerson")
}

function rightPerson() {
	mta.triggerEvent("rightPerson")
}

function femClick() {
	if(sexState == 0)
	{
		document.getElementById("femcont").style.backgroundColor = "#f7e";
		document.getElementById("fem").style.background = "url(\"images/female_active.png\") no-repeat";
		document.getElementById("fem").style.backgroundSize = "cover"
		document.getElementById("male").style.backgroundSize = "cover"
		mta.triggerEvent("chooseFemale")
		sexState = 2;
	}
	else if(sexState == 1)
	{
		document.getElementById("malecont").style.backgroundColor = "#eee";
		document.getElementById("male").style.background = "url(\"images/male_no_active.png\") no-repeat";
		document.getElementById("fem").style.backgroundSize = "cover"
		document.getElementById("male").style.backgroundSize = "cover"
		sexState = 2
		document.getElementById("femcont").style.backgroundColor = "#f7e";
		document.getElementById("fem").style.background = "url(\"images/female_active.png\") no-repeat";
		document.getElementById("fem").style.backgroundSize = "cover"
		document.getElementById("male").style.backgroundSize = "cover"
		mta.triggerEvent("chooseFemale")
	}
}

function maleClick() {
	if(sexState == 0)
	{
		document.getElementById("malecont").style.backgroundColor = "#38f";
		document.getElementById("male").style.background = "url(\"images/male_active.png\") no-repeat";
		document.getElementById("fem").style.backgroundSize = "cover"
		document.getElementById("male").style.backgroundSize = "cover"
		mta.triggerEvent("chooseMale")
		sexState = 1
	}
	else if(sexState == 2) 
	{
		document.getElementById("malecont").style.backgroundColor = "#38f";
		document.getElementById("male").style.background = "url(\"images/male_active.png\") no-repeat";
		document.getElementById("femcont").style.backgroundColor = "#eee";
		document.getElementById("fem").style.background = "url(\"images/female_no_active.png\") no-repeat";
		document.getElementById("fem").style.backgroundSize = "cover"
		document.getElementById("male").style.backgroundSize = "cover"
		mta.triggerEvent("chooseMale")
		sexState = 1
	}
}

function onLoadFunctions() {
	var male = document.getElementById("malecont")
	male.addEventListener("mouseover", myScript);
	male.addEventListener("mouseout", myScriptOut);
	var female = document.getElementById("femcont")
	female.addEventListener("mouseover", femin)
	female.addEventListener("mouseout", femout)
	document.getElementById("malecont").style.backgroundColor = "#38f";
	document.getElementById("male").style.background = "url(\"images/male_active.png\") no-repeat";
	document.getElementById("fem").style.backgroundSize = "cover"
	document.getElementById("male").style.backgroundSize = "cover"
}

window.onload = onLoadFunctions;