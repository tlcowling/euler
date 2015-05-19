#!/usr/bin/ruby

=begin
  A solution to problem 25 of the project Euler.
  
  Find the first fibonacci number with 1000 digits
=end

i = 1
t1, t2 = 0, 1
while t2.to_s.length < 1000
    t1, t2 = t2, t1 + t2
    i += 1
end
puts i

