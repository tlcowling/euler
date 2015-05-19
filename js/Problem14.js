var doMe = function(n){ 
	if(n % 2 === 0) return n/2;
	else return 3*n + 1;
}

function getNumberOfTerms(start){
	var times = 0;

	while(start !== 1) {
		start = doMe(start);
		times++;
	}

	return times+1;
}

var highestNumber = 1;

for(var x=1; x<=1000000; x++){
	var terms = getNumberOfTerms(x);
	if(terms>highestNumber) {
		console.log(x + ": " + terms);
		highestNumber = terms;
	}
}

console.log(highestNumber);
