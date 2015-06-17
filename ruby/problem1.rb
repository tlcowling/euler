#!/usr/bin/env ruby

#Problem 1

=begin

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

=end
timer_start = Time.now

answer = (1...1000).to_a.select{|n| n%3==0 || n%5==0}.reduce(:+)

puts "1. #{answer} (#{(Time.now-timer_start)*1000}ms)"
