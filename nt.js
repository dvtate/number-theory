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



function baseRepr(n, base) {
	let i = 0;
	while (base ** i < n)
		i++;		
	const ret = new Array(i);
	for (; i >= 0 && n; i--) {
		ret[i] = n % base;
		n = Math.floor(n / base);
	}
	 
	return ret;
}


const baseLiteral = (n, b) => baseRepr(n,b)
	.map(n => String([0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f'][n] || n))
	.join(b > 16 ? '-' : '');


// Binary exponentiation
function pow(x, n, m) {
	console.log(`${x} ** ${n} = ${x} ** 0b${baseLiteral(n, 2)}:`)
	let r = 1;
	let y = x;
	const isBigInt = typeof x === 'bigint';
	let p = 1
	while (n > 1) {
		if (n % 2 != 0) {
			console.log(`${(r * y) % m } = ${r} * ${y} (mod ${m}) `);
			r = (r * y) % m;
		}
		n = isBigInt ? n / 2 : Math.floor(n/2);
		y = (y * y) % m;
		p *= 2;
		console.log(`${y} = ${x} ** ${p} (mod ${m})`);
	}
	console.log(`${n}:\t${(r * y) % m } = ${r} * ${y} (mod ${m}) `);
	r = (r * y) % m;
	return r;
}

// put all this bs into Math.nt
module.exports = Math.nt = {
	genPrimes, isPrime, p, gcd, 
	lcm, fac, 
	baseLiteral, baseRepr, pow
};
