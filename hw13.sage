# 1
def order(a, n):
     ret = 1
     while True:
         if a ** ret % n == 1:
             return ret
         ret += 1

# [[8, 16, 16], [18, 18, 9], [11, 11, 22]]
print([[order(a, n) for a in (2,3,5)] for n in (17,19,23)])

# 4c 
# Intentionally poor performance to use the method described in assignment
def factor_prime_mersenne(p):
    N = 2 ** p - 1
    i = 1
    fac = 2 * i * p + 1
    srt_N = sqrt(N)
    while fac <= srt_N:
        if N % fac == 0:
            print(fac)
            #break # only asked for the smallest one 
        i += 1
        fac = 2 * i * p + 1

print('factors of 2^17 - 1:')        
factor_prime_mersenne(17)
# Doesn't print anything because 2^17 - 1 is prime

print('factors of 2^29 - 1:')
factor_prime_mersenne(29)
# 233
# 1103
# 2089

# 6b
print('order(3,17) = ', order(3, 17))
print('phi(17) = ', euler_phi(17))

# 6c
print('6c.:', [a for a in range(1, 17) if order(a, 17) == euler_phi(17)])
