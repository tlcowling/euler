#Problem 40
#=================
=begin

An irrational decimal fraction is created by concatenating the positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.

d1  d10  d100  d1000  d10000  d100000  d1000000

=end

timer_start = Time.now
bigstring = "0"

#Brute force
(1..1000000).each{|num|
	bigstring = bigstring + num.to_s
}

a = bigstring[1].to_i 
b = bigstring[10].to_i 
c = bigstring[100].to_i 
d = bigstring[1000].to_i 
e = bigstring[10000].to_i 
f = bigstring[100000].to_i 
g = bigstring[1000000].to_i

p a*b*c*d*e*f*g

p "It took #{(Time.now - timer_start)*1000} milliseconds"