import math

def evaluate(expansion):
    # work backwards to evaluate the expanded fraction
    num, den = 1, 0
    
    for i in xrange(len(expansion), 0, -1):
        den, num = num, den
        num += den * expansion[i-1]

    return num, den

largest = 0, 0

for s in xrange(1, 1001):
    a = a0 = int(math.sqrt(s))
    
    if a * a == s:
        # ignore perfect squares
        continue

    m = 0
    d = 1
    buf = [a0]
    num = a
    den = d
    while True:
        m = d * a - m
        d = (s - m**2) / d
        a = int((a0 + m) / d)
        buf.append(a)

        # evaluate the continued fraction
        num, den = evaluate(buf)
        if num**2 - (s*(den**2)) == 1:
            if num > largest[1]:
                largest = s, num
            break

print largest
