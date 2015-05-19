#Problem 52
#===============

=begin

It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

=end

timer_start = Time.now

starting_number = 111111	

def sorted_digits_of(number)
	number.to_s.split(//).sort.join.to_i
end

def multiples_contain_digits(number)
	digit_test = sorted_digits_of(number)

	5.times{ 
		|x| 
		if !(digit_test == sorted_digits_of(number*(x+2)))

			return false
		end
	}

	return true
end

until multiples_contain_digits(starting_number)
	starting_number+=1
end

p "The smallest integer whose multiples have the same digits is #{starting_number}"
p "It took #{(Time.now-timer_start)*1000} milliseconds"