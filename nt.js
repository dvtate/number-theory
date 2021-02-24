// Quick library for testing things in JS console

// Generate primes via the Siev of aristopholese
function genPrimes(end) {
	const range = [];
	for (let i = 2; i < end; i++)
		range.push(i);
		
	const marks = [];
	
	return range.filter(n => {
		if (!marks[n]) {
			for (let k = n ** 2; k < end; k += n)
				marks[k] = true;
			return true;
		}
	});
}

// Test primality
function isPrime(n) {
	n = BigInt(n);
	const cap = BigInt(Math.sqrt(n));
	for (let i = 2n; i <= cap; i++)
		if (n % i == 0n)
			return false;
	return true;
}


// n'th prime number
function p(n, primes) {
	return (primes || genPrimes(2 ** ((2 ** n) - 1)))[n];
}


// Greatest common denominator
function gcd(a, b) {
	r = a%b;
	return r? gcd(b,r) : b;
}

// Least common multiple
function lcm(a, b) {
	return a * b / gcd(a, b);
}


// Factorial
function fac(n) { 
	return n > 1n ? n * Math.factorial(n-1n) : 1n; 
}


// put all this bs into Math.nt
module.exports = Math.nt = {
	genPrimes, isPrime, p, gcd, 
	lcm, fac,
};
