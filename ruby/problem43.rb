# File:  problem43.rb

#Problem 43
#=================

# The number, 1406357289, is a 0 to 9 padndigital bumber because it is made up of each of the digits 0 to 9
# in some order, but it also has a rather interesting sub-string divisbility property.

# Let d1 be the 1st digit, d2 be the 2nd digit, and so on.  In this way, we note the following:

# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17

timer_start = Time.now

def substring_divisible_by_two(number)
	test_digit= number[3].chr

	(test_digit == "2" || test_digit == "4" ||
	test_digit == "6" || test_digit == "8" ||
	test_digit == "0")
end

def substring_divisible_by_three(number)
	substr = number[2].chr.to_i+number[3].chr.to_i+number[4].chr.to_i
	substr % 3 == 0
end

def substring_divisible_by_five(number)
	test_digit = number[5].chr.to_i
	(test_digit == 0 || test_digit == 5)
end

def substring_divisible_by_seven(number)
	number.slice(4,3).to_i % 7 == 0
end

def substring_divisible_by_eleven(number)
	number.slice(5,3).to_i % 11 == 0
end

def substring_divisible_by_thirteen(number)
	number.slice(6,3).to_i % 13 == 0
end

def substring_divisible_by_seventeen(number)
	number.slice(7,3).to_i % 17 == 0
end

def has_substring_property(number)
	if !substring_divisible_by_two(number)
		return false
	end

	if !substring_divisible_by_three(number)
		return false
	end

	if !substring_divisible_by_five(number)
		return false
	end

	if !substring_divisible_by_seven(number)
		return false
	end

	if !substring_divisible_by_eleven(number)
		return false
	end

	if !substring_divisible_by_thirteen(number)
		return false
	end

	if !substring_divisible_by_seventeen(number)
		return false
	end
	
	return true
end

sum = 0
pandigitals = "0123456789".split(//).permutation.to_a

pandigitals.each{
	|pandigital|
	str = pandigital.join
	if has_substring_property(str)
		sum += str.to_i
	end
}

p "The sum of all the pandigital numbers with the substring property is #{sum}"
p "It took #{(Time.now-timer_start)*1000} milliseconds"