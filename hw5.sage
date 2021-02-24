######
# Q1.
######
# Compute function values
fns = {
    'f' : lambda x: x**2 + x + 17,
    'g' : lambda x: x**2 + 21*x + 1,
    'h' : lambda x: 3*x**2 + 3*n + 23,
};
for f in fns:
    for n in (1..):
        if not is_prime(fns[f](n)):
            print(f, 'first composite at n =', n)
            break

#######
# Q2.
#######
# list of primes to test
P = Primes()

# Verify the conjecture for a given number n
def conj_holds(n):
    # Try all primes p < n
    primes =  [P.unrank(i) for i in range(n) if P.unrank(i) < n]
    for p in primes:
        # Try all integers 0 <= a < n
        for a in range(n):
            # Test formula
            if n == p + 2 * a ** 2:
                return True
    return False

print('Q2 conj holds for n = 5777: ', conj_holds(5777))

#######
# Q3. 
#######
# Let primes = set of all primes < 75 union {1}
primes = [1] + [P.unrank(n) for n in range(75) if P.unrank(n) < 75]

# For each odd integer 3 <= n < 76
for n in range(3, 76, 2):
    def holds(n):
        # For each pair of integers p and q in the set 'primes' (cartesian product)
        for p in primes:
            for q in primes:
                # If the conjecture holds return True
                if n == p + 2 * q:
                    print('%s = %s + 2*%s' % (n, p, q))
                    return True
        # The formula does not hold as nothing was found
        return False

    # Check for counter examples
    if not holds(n):
        print ("counterexample %s" % n)
