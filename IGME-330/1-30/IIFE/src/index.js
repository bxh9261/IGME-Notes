(function () {
	"use strict";
	
	window.onload = init;
	
	const appData = {
		appHeadingText: "Greeter App",
		appInstructionsHeading: "Instructions for this exercise",
		appInstructionsText: "We are going to refactor the code in this example so that all the JS is wrapped in an IFFE, and has been moved to external files:"
	};
	
	function init(){
		document.querySelector("h1").innerHTML = appData.appHeadingText;
		document.querySelector("h2").innerHTML = appData.appInstructionsHeading;
		document.querySelector("#instructions").innerHTML = appData.appInstructionsText;
		
		document.querySelector("#greetButton").onclick = greetButtonClicked;
		document.querySelector("#shoutButton").onclick = shoutButtonClicked;
	}

	function greetButtonClicked(){
		let firstName = document.querySelector("#firstName").value;
		let lastName = document.querySelector("#lastName").value;
		output.innerHTML = textLIB.greetify( `${firstName} ${lastName}` );
	}
	
	function shoutButtonClicked(){
		let firstName = document.querySelector("#firstName").value;
		let lastName = document.querySelector("#lastName").value;
		output.innerHTML = textLIB.shoutify( `${firstName} ${lastName}` );
	}
	
})();