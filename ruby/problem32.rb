#!/usr/bin/env ruby

#Problem 32

=begin

  We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
  
  The product 7254 is unusual, as the identity, 39  186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
  
  Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
  
  HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

=end
require 'prime'

timer_start = Time.now

@pandigitals = []

def factors_of(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort.map{|div| [div, number / div]}
end

def pandigital_identity(number)
  identities = []
  factors_of(number).each{
    |x|
    identities << x.join + number.to_s
  }
  identities
end

def pan_test(num)
  pandigital_identity(num).each{
  |id|
  if id.split(//).sort.join == "123456789"
    @pandigitals << num
  end
}
end

(1000..10000).each{
  |x| 
  pan_test(x)
}

sum = @pandigitals.uniq.reduce(:+)

puts "32. #{sum} (#{(Time.now - timer_start)*1000} ms)"
