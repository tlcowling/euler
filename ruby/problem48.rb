# Problem 48
#================

=begin

The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.
	
=end

sum = 0
(1..1000).each{
	|x| 
	sum += x**x
}

puts "The last 10 digits are #{sum.to_s.slice(-10,10)}"