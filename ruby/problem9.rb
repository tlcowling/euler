#!/usr/bin/env ruby
# Problem 9

=begin

  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
  
  a2 + b2 = c2
  For example, 32 + 42 = 9 + 16 = 25 = 52.
  
  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.

=end
require 'mathn'

timer_start = Time.now

# Use some Berggen methods!

p = Matrix.column_vector([3,4,5])

A = Matrix[ [1, -2, 2], [2, -1, 2], [2, -2, 3] ]
B = Matrix[ [1, 2, 2], [2, 1, 2], [2, 2, 3] ]
C = Matrix[ [-1, 2, 2], [-2, 1, 2], [-2, 2, 3] ]

current_level = [p]
next_level = []
answer = nil
required_sum = 1000

while true do
  current_level.each {|r|
    newA = A*r
    newB = B*r
    newC = C*r
    next_level.push(newA, newB, newC)

    # took a while to realise but this just generates primitives, i also need to consider multiples
    next_level.each{|r| 
      sum = r.reduce(:+)
      answer = r if (required_sum % sum == 0)
    }
  }

  current_level = next_level
  next_level=[]
  break if answer
end

factor = required_sum / answer.reduce(:+)
triplet = answer * factor
product = triplet.reduce(:*)

time = (Time.now-timer_start)*1000
puts "#{product} (#{time}ms)"

