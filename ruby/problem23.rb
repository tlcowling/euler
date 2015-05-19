#Problem 23
#=================
=begin
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

=end

require 'prime'

def factors_of(number)
  primes, powers = number.prime_division.transpose
  p powers.class

  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort.map{|div| [div, number / div]}
end

def unique_factors_of(number)
	factors = factors_of(number)
	uniqueFactorCount = factors.length/2
	factors.slice(0, uniqueFactorCount)
end

def sum_of_proper_divisors_of(number)
	factors = unique_factors_of(number)

	sum = 0
	factors.each{|factor_pairs|
		factor_pairs.each{|factor|
			sum = sum + factor
		}
	}
	sum - number
end

def is_abundant(number)
	number = number.to_i
	sum_of_proper_divisors_of(number) > number
end

def find_abundants(limit)
	arr = []
	i=1
	while i<limit
		if is_abundant(i) 
			arr.push(i)
		end
		i = i+1
	end
end

p find_abundants(100)
# p sum_of_proper_divisors_of(100)
