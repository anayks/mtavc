function moveRect(e) {
	if(e.keyCode == 13) 
	{
		mta.triggerEvent("Regars", document.getElementById("firstpass").value, document.getElementById("secpass").value);
	}
}

function clickReg() {
	mta.triggerEvent("Regars", document.getElementById("firstpass").value, document.getElementById("secpass").value);
}

function onLoadFunctions() {
	addEventListener("keydown", moveRect);
}

window.onload = onLoadFunctions;