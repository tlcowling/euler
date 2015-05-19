#Problem 30

=begin
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44
As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
=end

max = 9**5 * 4
sum_of_digit_sums = 0

def digit_sum(number)
	sum=0
	number.to_s.split(//).each{
		|digit|
		sum = sum+ digit.to_i ** 5
	}
	sum
end

(2..max).each{
	|number|
	sum = digit_sum(number)
	sum_of_digit_sums += number if (number == sum)
}

puts "The sum of all the numbers that can be expressed as the sum of the fifth powers of their digits is #{sum_of_digit_sums}"