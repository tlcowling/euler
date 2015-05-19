
function sieve(max) {
	var D = []; 
	var primes = [];
	
	for (var q=2; q<max; q++) {
		if (D[q]) {
			for (var i=0; i<D[q].length; i++) {
				 var p = D[q][i];
				 if (D[p+q]) D[p+q].push(p);
				 else D[p+q]=[p];
			}
			delete D[q];
		} else {
			primes.push(q);
			if (q*q<max) D[q*q]=[q];
		}
	}
	return primes;
 }

function primeFactorization(num){
  var root = Math.sqrt(num),  
  result = arguments[1] || [],  //get unnamed paremeter from recursive calls
  x = 2; 

  if(num % x){
	//if not divisible by 2 
   	x = 3;//assign first odd
   	while((num % x) && ((x = x + 2) < root)){}//iterate odds
  }

  //if no factor found then num is prime
  x = (x <= root) ? x : num;
  result.push(x);//push latest prime factor

  //if num isn't prime factor make recursive call
  return (x === num) ? result : primeFactorization(num/x, result) ;
}

