#!/usr/bin/env ruby
#Problem 16

=begin

  215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

  What is the sum of the digits of the number 21000? 

=end

timer_start = Time.now

answer = (2**1000).to_s.split(//).map(&:to_i).reduce(:+)

puts "16. #{answer} (#{(Time.now - timer_start) * 1000} ms)"
