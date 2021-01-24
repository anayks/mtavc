function addText(id, str) {
	var strf = document.getElementById(id).outerHTML;
	var naid = str.search("#");
	if(naid == -1) 
	{
		document.getElementById(id).innerHTML = strf + "<div class=\"filler-text-str\">" + str + "</div>";
	}
	else
	{
		var str1 = str.substring(naid, naid+4);
		var str2 = str.substring(naid+4, str.length);
		document.getElementById(id).innerHTML = strf + "<div class=\"filler-text-str\"><font color=\"" + str1 + "\">" + str2 + "</font></div>";
	}
}

function trackLoad() {
	document.getElementById("block").style.visibility = "visible";
	mta.triggerEvent("trackBrowser")
}

function editText(id, str) {
	document.getElementById(id).textContent = str;
}

function dialogResponseTrue() {
	mta.triggerEvent("DialogResponse", 1, document.getElementById("inputtext").value);
}

function dialogResponseFalse() {
	mta.triggerEvent("DialogResponse", 0, document.getElementById("inputtext").value);
}