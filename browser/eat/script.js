function updateEat(arg1) {
	let arg3 = "a";
	if(arg1 == 1)
	{
		arg3 = "250$";
	}
	else
	{
		arg3 = "БЕСПЛАТНО";
	}
	document.getElementById("left-btn").textContent = arg3;
}

function leftClick() {
	mta.triggerEvent("leftEatChoose")
}

function rightClick() {
	mta.triggerEvent("rightEatChoose")
}

function onLoadFunctions() {
}

window.onload = onLoadFunctions;