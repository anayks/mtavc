function checkPass() {
	mta.triggerEvent("avtr", document.getElementById("pass").value, 255, 255, 0);
}

function moveRect(e) {
	if(e.keyCode == 13) 
	{
		mta.triggerEvent("avtr", document.getElementById("pass").value, 255, 255, 0);
	}
}

function changeName(name) {
	document.getElementById("pname").textContent = name;
}

function onLoadFunctions() {
	addEventListener("keydown", moveRect);
}

window.onload = onLoadFunctions;