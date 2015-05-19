#Problem 34
#=====================

=begin

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.

=end

timer_start = Time.now

def factorial(n)
  if n==0 
  	return 1 
  end
  1.upto(n).inject(:*)
end

def sum_of_factorial_of_digits(number)
	digits = []
	number.to_s.split(//).each{
		|n| 
		digit_factorial = factorial(n.to_i)
		digits.push(digit_factorial)
	}

	digits.inject(:+)
end

max = 50000
i=3
factorial_digit_sums = []

until i == max
	if sum_of_factorial_of_digits(i) == i
		factorial_digit_sums.push(i)
	end
	i += 1
end

p "The sum of the numbers whose digit factorials sum to their total is #{factorial_digit_sums.inject(:+)}"
p "It took #{(Time.now - timer_start)*1000} milliseconds"

