######
# Q1.
######

# Named functions from the assignment
fns = {
    'f' : lambda x: x**2 + x + 17,
    'g' : lambda x: x**2 + 21*x + 1,
    'h' : lambda x: 3*x**2 + 3*n + 23,
};

# For each function calculate values until we encounter a composite
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

'''​output:
f first composite at n = 16
g first composite at n = 18
h first composite at n = 22
Q2 conj holds for n = 5777:  False
3 = 1 + 2*1
5 = 1 + 2*2
7 = 1 + 2*3
9 = 3 + 2*3
11 = 1 + 2*5
13 = 3 + 2*5
15 = 1 + 2*7
17 = 3 + 2*7
19 = 5 + 2*7
21 = 7 + 2*7
23 = 1 + 2*11
25 = 3 + 2*11
27 = 1 + 2*13
29 = 3 + 2*13
31 = 5 + 2*13
33 = 7 + 2*13
35 = 1 + 2*17
37 = 3 + 2*17
39 = 1 + 2*19
41 = 3 + 2*19
43 = 5 + 2*19
45 = 7 + 2*19
47 = 1 + 2*23
49 = 3 + 2*23
51 = 5 + 2*23
53 = 7 + 2*23
55 = 17 + 2*19
57 = 11 + 2*23
59 = 1 + 2*29
61 = 3 + 2*29
63 = 1 + 2*31
65 = 3 + 2*31
67 = 5 + 2*31
69 = 7 + 2*31
71 = 13 + 2*29
73 = 11 + 2*31
75 = 1 + 2*37
'''
