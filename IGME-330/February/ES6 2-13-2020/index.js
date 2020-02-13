import * as anythingIWant from "utils.js";

	const appData = {
		appHeadingText: "Greeter App",
		appInstructionsHeading: "Instructions for this exercise",
		appInstructionsText: "We are going to refactor the code in this example so that all the JS is placed in multiple ES6 modules, and has been moved to external files:"
	};
	
	function init(){
		document.querySelector("h1").innerHTML = appData.appHeadingText;
		document.querySelector("#instructionsHeading").innerHTML = appData.appInstructionsHeading;
		document.querySelector("#instructions").innerHTML = appData.appInstructionsText;
		
		document.querySelector("#greetButton").onclick = greetButtonClicked;
		document.querySelector("#shoutButton").onclick = shoutButtonClicked;
	}

	function greetButtonClicked(){
		let firstName = document.querySelector("#firstName").value;
		let lastName = document.querySelector("#lastName").value;
		output.innerHTML = anythingIWant.greetify( `${firstName} ${lastName}` );
	}
	
	function shoutButtonClicked(){
		let firstName = document.querySelector("#firstName").value;
		let lastName = document.querySelector("#lastName").value;
		output.innerHTML = anythingIWant.shoutify( `${firstName} ${lastName}` );
	}
	
    export{init};

	