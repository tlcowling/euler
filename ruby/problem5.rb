#!/usr/bin/env ruby
#Problem 5

=begin

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

=end

timer_start = Time.now

# This is actually quite straightforward mathematically you can take prime factors
#
# 1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10 * 11 * 12 * 13 * 14 * 15 * 16 * 17 * 18 * 19 * 20 
#
#     2 * 3 * 2 * 5 *     7 * 2 * 3 *      11 *      13           * 2  * 17 *      19 

answer = 2*3*2*5*7*2*3*11*13*2*17*19

puts "5. #{answer} (#{(Time.now-timer_start)*1000} ms)"
