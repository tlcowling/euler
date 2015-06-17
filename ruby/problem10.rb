#!/usr/bin/env ruby
# Problem 10

=begin

  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.

=end
require 'mathn'

timer_start = Time.now

sum = Prime.take_while {|p| p < 2000000 }.reduce(:+)

time = (Time.now-timer_start)*1000
puts "10. #{sum} (#{time}ms)"

