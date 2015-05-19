#Problem 41
#===============

=begin

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?

=end

require 'mathn'

timer_start = Time.now

puts (1..9).flat_map {
	|n| ('1'..n.to_s).to_a.permutation.map{
		|p| p.join('').to_i
	}.select { |i| i.prime? }
}.max

p "It took #{(Time.now - timer_start)*1000} milliseconds"