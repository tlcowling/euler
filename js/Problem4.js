//returns True if any number is palindromic
var numberAsArray = function(number){
	if(typeof(number) !== "number"){
		console.log("Number must be an integer...");
		return [];
	}
	
	var numberAsString = number.toString();
	var numDigits = numberAsString.length;
	var digits = [];
	
	for(var i=0; i<numDigits; i++) {
		digits.push(parseInt(numberAsString[i]));
	}
	
	return digits;
	
};

var equalArrays = function(a1,a2){
	return a1.join('') == a2.join('');
}

var isPalindrome = function(number){
	var numberArray = numberAsArray(number);
	var numberLength = numberArray.length;
	
	var firstHalf = numberArray.slice(0, numberLength/2);
	var secondHalf = numberArray.slice(Math.ceil(numberLength/2)).reverse();

	if(equalArrays(firstHalf,secondHalf)) return true;
	return false;
};

var highest = 0;
var number = 0;

for(var i=1000; i>100; i--){
	for(var j=1000; j>100; j--){
		number = i*j;
		if(isPalindrome(number) && number>highest) highest = number;
	}
}