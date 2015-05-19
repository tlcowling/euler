#Problem 3
#===========

=begin

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

=end

require 'prime'
prime = 600851475143

timer_start = Time.now

prime_factors = prime.prime_division
factor = prime_factors.max[0] * prime_factors.max[1]

p "The highest prime factor of #{prime} is #{factor}"
p "It took #{(Time.now- timer_start)*1000} milliseconds"

