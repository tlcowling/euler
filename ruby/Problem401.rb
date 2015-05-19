#Problem 401
=begin
	
The divisors of 6 are 1,2,3 and 6.
The sum of the squares of these numbers is 1+4+9+36=50.

Let sigma2(n) represent the sum of the squares of the divisors of n. Thus sigma2(6)=50.

Let SIGMA2 represent the summatory function of sigma2, that is SIGMA2(n)=sigma2(i) for i=1 to n.
The first 6 values of SIGMA2 are: 1,6,16,37,63 and 113.
Find SIGMA2(1015) modulo 109.
	
=end

require 'prime'
def factors_of(number)
  primes, powers = number.prime_division.transpose
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

def ordered_unique_factors_of(number)
	factors = []

	unique_factors_of(number).map! {
		|pair|
		factors.push(pair[0])
		factors.push(pair[1])
	}
	factors.sort!
end

def sigma2(n)
	
end	

p ordered_unique_factors_of(4800)
