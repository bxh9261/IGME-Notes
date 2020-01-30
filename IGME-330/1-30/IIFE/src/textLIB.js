(function () {
"use strict";
function greetify(fullName){
		let greetings = ["Hello", "Hi", "Bonjour", "Guten tag", "Hola", "Shalom", "Salve"];
		let randomGreeting = greetings[Math.floor(Math.random() * greetings.length)];
		return `${randomGreeting} ${fullName}`;
}
	
function shoutify(fullName){
		let exclamations = ["!", "!!", "!?!", "?!!", "@#$%!", "???", "!!!"];
		let randomExclamation = exclamations[Math.floor(Math.random() * exclamations.length)];
		return `Hey ${fullName} ${randomExclamation}`.toUpperCase();
}
    
window["textLIB"] = {
    greetify,
    shoutify
};
    
})();