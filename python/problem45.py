from math import sqrt
 
def is_pentagonal(n):
  p = ( sqrt(1 + 24*n) + 1 ) / 6
  return p==int(p)
 
n = 165 
while True:
  n += 1 
  hex = n * (2 * n-1)
  if is_pentagonal(hex): break 
 
print "Answer to PE45 = ",hex