####
# Q8
####

# This should brute force the solutions
d = 19 ** 2
for x in range(1, d):
    for y in range(d, 2 * d):
        if x * y % 20 == 1:
            print(x, y)
