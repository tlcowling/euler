#!/usr/bin/env ruby
#Problem 6
#=====================

=begin

The sum of the squares of the first ten natural numbers is,

12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

=end

timer_start = Time.now

require 'mathn' # for fractions

# sum of the first n numbers is nice (theres also a nice anecdote about how Euler ( I think ) as a child impressed the mathematics teacher who asked what the sum of the first 1000 numbers was in order to shut the class up, and being the genius he was came up with the answer by this method))
def square_of_n_integers n
  ((n/2) * (n+1))**2
end

# and theres also a mathematical equation for calculating the sum of the square numbers 
def sum_of_squares n
  (n**3)/3 + (n**2)/2 + n/6 
end

n = 100
answer = square_of_n_integers(n) - sum_of_squares(n)
p answer

puts "This took #{(Time.now-timer_start)*1000} milliseconds"
