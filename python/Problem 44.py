from math import sqrt
 
def is_pentagonal(n):
  p = ( sqrt(1 + 24*n) + 1 ) / 6
  return p==int(p)
 
def pe44():
  i=0;
  pent = [1]
  while True:
    i+=1
    pent.append( i * (3*i - 1) / 2 )
    for j in range(2, len(pent)-1):
      if is_pentagonal(pent[i]-pent[j]) and is_pentagonal(pent[i]+pent[j]):
        return pent[i]-pent[j]
 
print "Answer to PE44 = ",pe44()