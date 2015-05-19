#Problem 49
#===================
=begin
	The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

	There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.

	What 12-digit number do you form by concatenating the three terms in this sequence?	

=end

require 'mathn'

def ordered_characters_of_array(array)
	array.to_s.chars.to_a.sort
end

def array_contains_permutations?(array)
	if !array.empty? 
		digits = ordered_characters_of_array(array[0])
	end

	array.each{
		|num| 
		if ordered_characters_of_array(num) != digits
			return false
		end
	}

	return true
end

def array_contains_all_primes?(array)
	array.each{
		|number|
		if !number.prime?
			return false
		end
	}

	return true
end

primes = Prime.take_while{|prime| prime < 10000-6660 }
primes = primes.reject {|prime| prime < 999 }
prime_triples = []

primes.each{
	|prime|
	triples = [prime, prime+3330, prime+6660]
	if array_contains_permutations?(triples)
		prime_triples.push(triples)
	end
}

prime_triples = prime_triples.select{
	|prime_triple|
	 array_contains_all_primes?(prime_triple) 
}

p prime_triples