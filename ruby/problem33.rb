#!/usr/bin/env ruby

# Problem 33

=begin

  The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

  We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
  
  There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
  
  If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

=end

require 'mathn'

timer_start = Time.now

fractions = []
i=1
j=2

until i>99 do
  until j>99 do
    fractions.push(i/j)
    j+=1
  end
  j=1
  i+=1
end

sum = 0

p "33. #{sum} (#{(Time.now - timer_start)*1000} ms)"
