# Problem 47
# ============

=begin
	
The first two consecutive numbers to have two distinct prime factors are:

14 = 2  7
15 = 3  5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2²  7  23
645 = 3  5  43
646 = 2  17  19.

Find the first four consecutive integers to have four distinct primes factors. What is the first of these numbers?

=end

require 'prime'

def four_distinct_factors? (prime_division_array)
	distinct_factors = []
	prime_division_array.each {
		|prime_divisors|
		if prime_divisors.count == 4
			prime_divisors.each {
				|prime, exponent|
				distinct_factors.push(prime ** exponent)
			}
		else
			return false
		end
	}
	return distinct_factors.count == 16
end


start=646
p_factors_list = []

until four_distinct_factors?(p_factors_list)
	p_factors_list = []

	(start...(start+4)).to_a.each{
		|consecutiveInteger|
		p_factors_list.push(consecutiveInteger.prime_division)
	}
	answer = start
	start+=1
end

p "The first of four consecutive numbers to each have 4 distinct prime factors is #{answer}"

