#!/usr/bin/env ruby

#Problem 28

=begin

  Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

  43 44 45 46 47 48 49
  42 21 22 23 24 25 26
  41 20  7  8  9 10 27
  40 19  6  1  2 11 28
  39 18  5  4  3 12 29
  38 17 16 15 14 13 30
  37 36 35 34 33 32 31
  
  It can be verified that the sum of the numbers on the diagonals is 101.
  
  What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
  
  1,3,5,7,9,13,17,21,25, 31, 37, 43, 49
  OR
  1 + 9+7+5+3 + 25+21+17+13  

=end

timer_start = Time.now

diagonals = [1]

odd_numbers = (3..1001).to_a.select{|number| number%2!=0}
odd_squares = odd_numbers.map{|odd| odd**2}

odd_squares.each {
  |odd_square|
  
  i=1
  
  diagonals.push(odd_square)
  add_index = odd_square**0.5 - 1
  
  while i < 4
    diagonals.push(odd_square-add_index*i)
    i+=1
  end
}

sum = diagonals.inject(:+)
puts "28. #{sum} (#{(Time.now - timer_start)*1000} ms)"
