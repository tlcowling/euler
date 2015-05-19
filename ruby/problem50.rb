#!/usr/bin/env ruby

timer_start = Time.now
require 'mathn'
primes = Prime.each(10000).to_a
longest = []

primes[0..10].each_with_index {|p, i|
	count = i
	begin
		count += 1
		consecutivePrimes = primes[i..count]
		sum = consecutivePrimes.reduce(:+)
		if sum.prime? && consecutivePrimes.length > longest.length
			longest = consecutivePrimes
		end
	end while sum < 1000000
}

puts longest.reduce(:+)
puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"