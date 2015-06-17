#!/usr/bin/env ruby

# Problem 50

=begin

  The prime 41, can be written as the sum of six consecutive primes:

  41 = 2 + 3 + 5 + 7 + 11 + 13
  This is the longest sum of consecutive primes that adds to a prime below one-hundred.
  
  The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
  
  Which prime, below one-million, can be written as the sum of the most consecutive primes?

=end

require 'mathn'

timer_start = Time.now
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

answer = longest.reduce(:+)
puts "50. #{answer} (#{(Time.now - timer_start)*1000}) ms"
