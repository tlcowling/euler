#!/usr/bin/env ruby
#Problem 7

=begin

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?

=end

timer_start = Time.now

# I probably should actually work through this, but I've done it before: Sieve of Eratosthenes and a whole bunch of other algorithms so this time, 
# its the mathn library again
require 'mathn'
answer = Prime.take(10001).last

puts "7. #{answer} #{(Time.now-timer_start)*1000} ms)"
