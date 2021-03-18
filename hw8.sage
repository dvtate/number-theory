
# We know that 2821 must be composite as the factorization is given as 2821 = 7 · 13 · 31

# Determines if a number is a carmichael number or not
def is_carmichael(n):
    # for all bases a 0 - n
    for a in range(n+1):
        # a^n-a should be zero (mod n) when gcd(a,n) = 1
        if gcd(a, n) == 1 and ((a ** n - a) % n != 0):
            return False
    return True

print(is_carmichael(2821)) # True
#print(is_carmichael(340)) # False

