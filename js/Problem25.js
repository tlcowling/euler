// var fibonacci = function (n) {
// 	if(n === 0) return 1;
// 	if(n === 1) return 1;
// 	return fibonacci(n-2) + fibonacci(n-1); 
// };

var fibonacci = (function () {
    "use strict";
    fibonacci = { };
    fibonacci.mem = {
        0 : 0,
        1 : 1
    };

    // Calculate Fibonacci with function memoization
    fibonacci.calculate = function (n) {
        if (fibonacci.mem[n] !== undefined) { return fibonacci.mem[n]; }

        fibonacci.mem[n] = (fibonacci.calculate(n - 1) + fibonacci.calculate(n - 2));
        return fibonacci.mem[n];
    };

    return fibonacci;
}());