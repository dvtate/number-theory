# https://twitter.com/Daanniii6/status/1381998887481847814

def pow2_ld(n):
    p2 = 1 << n
    return int(p2 / 10 ** int(log(p2) / log(10)))
 
def pow2_ld_freq(ss):
    freq = { 1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0}
    for ld in map(pow2_ld, range(ss)):
        freq[ld] += 1
    return freq

pow2_ld_freq(100000)
