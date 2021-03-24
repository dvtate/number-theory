# if n is composite returns two factors of n
# if n is prime returns n in a list
def fermat_factor(n):
    # A prime's only factor is itself and 1
    if is_prime(n):
        return [n]
        
    # Find value of x such that sqrt(x**2 - n) is an integer
    #   This value is y in n = x**2 - y ** 2 = (x + y)*(x - y)
    #   Which can plugged in to get two factors of n
    x = int(sqrt(n))
    max_x = (n + 1) / 2
    print('finding x&y for', n,'...')
    while x < max_x:
        print(' y**2 ?= %s ** 2 - %s = %s --> %s' % (x, n, x ** 2 - n, isinstance(sqrt(x ** 2 - n), Integer)))
        if isinstance(sqrt(x ** 2 - n), Integer):
            break
        x += 1
    else:
        print('care!')

    # Use determined value for y
    y = sqrt(x ** 2 - n)
    
    # This works! :D
    print(n, '= (%s + %s)(%s - %s) = (%s)(%s) = %s\n' % (x,y,x,y, x + y, x - y, (x - y)*(x+y)))
    
    # Return the two factors
    return [x + y, x - y]
 

# Returns a list of lists of equivalent factors for n
def complete_fermat_factor(n):
    facs = [n]
    ret = []
    while True:
    	# Add value to return
        ret.append(facs)
        
        # Factor the factors
        tmp = []
        for l in map(fermat_factor, facs):
            tmp += l
        
        # Nothing changed, we're done
        if repr(facs) == repr(tmp):
            return ret
            
		# Update factors
        facs = tmp

# TODO combine equiv factors into exprs that shows power
def show_factorization(n):
    print('\n = '.join(map(lambda facs: ' * '.join(map(str, facs)), complete_fermat_factor(n))))
    

show_factorization(2 ** 11)
