def ext_euc(a,b): 
	r_1, r_2 = a, b
	s_1, s_2 = 1, 0
	t_1, t_2 = 0, 1
	while r_2 > 0: 
		q = int(r_1 / r_2)
		r = r_1 - q * r_2
		s = s_1 - q * s_2
		t = t_1 - q * t_2
		r_1, r_2 = r_2, r
		s_1, s_2 = s_2, s
		t_1, t_2 = t_2, t
	return (r_1, s_1, t_1)

n = 2623
p = factor(n)[0][0]
q = factor(n)[1][0]
k = 869
j = ext_euc(k, euler_phi(2623))[1]
if j < 0:
	j += euler_phi(2623)
	
print('n = ', n)
print('p = ', p)
print('q = ', q)
print('k = ', k)
print('j = ', j)

# Decrypt a list of numbers
def decrypt(l):
	return list(map(lambda c: c ** j % n, l))

print(decrypt([1030, 1511, 744, 1237, 1719]))

'''
n =  2623
p =  43
q =  61
k =  869
j =  29
[1804, 1111, 2618, 714, 1719]
'''
