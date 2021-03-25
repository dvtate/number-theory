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
        is_square = isinstance(sqrt(x ** 2 - n), Integer)
        print(' y**2 ?= %s ** 2 - %s = %s --> %s'
            % (x, n, x ** 2 - n, (str(sqrt(x ** 2 - n)) 
                + ' ** 2') if is_square else 'not a square'))
        if is_square:
            break
        x += 1
    else:
        print('care!')

    # Use determined value for y
    y = sqrt(x ** 2 - n)
    
    # This works! :D
    print(n, '= (%s + %s)(%s - %s) = (%s)(%s) = %s\n' 
    	% (x,y,x,y, x + y, x - y, (x - y)*(x+y)))
    
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
    

###
# Question 6
###

print('6a:')
show_factorization(2 ** 11 - 1)

print('\n---------\n')
print('6b:')

show_factorization(340663)

# Output for question 6
'''
6a:
finding x&y for 2047 ...
 y**2 ?= 45 ** 2 - 2047 = -22 --> not a square
 y**2 ?= 46 ** 2 - 2047 = 69 --> not a square
 y**2 ?= 47 ** 2 - 2047 = 162 --> not a square
 y**2 ?= 48 ** 2 - 2047 = 257 --> not a square
 y**2 ?= 49 ** 2 - 2047 = 354 --> not a square
 y**2 ?= 50 ** 2 - 2047 = 453 --> not a square
 y**2 ?= 51 ** 2 - 2047 = 554 --> not a square
 y**2 ?= 52 ** 2 - 2047 = 657 --> not a square
 y**2 ?= 53 ** 2 - 2047 = 762 --> not a square
 y**2 ?= 54 ** 2 - 2047 = 869 --> not a square
 y**2 ?= 55 ** 2 - 2047 = 978 --> not a square
 y**2 ?= 56 ** 2 - 2047 = 1089 --> 33 ** 2
2047 = (56 + 33)(56 - 33) = (89)(23) = 2047

2047
 = 89 * 23

---------

6b:
finding x&y for 340663 ...
 y**2 ?= 583 ** 2 - 340663 = -774 --> not a square
 y**2 ?= 584 ** 2 - 340663 = 393 --> not a square
 y**2 ?= 585 ** 2 - 340663 = 1562 --> not a square
 y**2 ?= 586 ** 2 - 340663 = 2733 --> not a square
 y**2 ?= 587 ** 2 - 340663 = 3906 --> not a square
 y**2 ?= 588 ** 2 - 340663 = 5081 --> not a square
 y**2 ?= 589 ** 2 - 340663 = 6258 --> not a square
 y**2 ?= 590 ** 2 - 340663 = 7437 --> not a square
 y**2 ?= 591 ** 2 - 340663 = 8618 --> not a square
 y**2 ?= 592 ** 2 - 340663 = 9801 --> 99 ** 2
340663 = (592 + 99)(592 - 99) = (691)(493) = 340663

finding x&y for 493 ...
 y**2 ?= 22 ** 2 - 493 = -9 --> not a square
 y**2 ?= 23 ** 2 - 493 = 36 --> 6 ** 2
493 = (23 + 6)(23 - 6) = (29)(17) = 493

340663
 = 691 * 493
 = 691 * 29 * 17
'''
;

