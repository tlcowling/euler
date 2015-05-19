#Problem 56
#=================

=begin

A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, ab, where a, b  100, what is the maximum digital sum?

=end

timer_start = Time.now

a,b,max = 0,0,0

def digit_sum(number)
	number.to_s.split(//).inject(0){|sum,n| sum+n.to_i}
end

(1...100).each { |i|
	(1...100).each{ |j|
		sum = digit_sum(i**j) 
		if sum>max
			max = sum if sum > max 
			a=i
			b=j
		end
	}
}

p "The maximum digit sum is for #{a}^#{b} and the sum of the digits is #{max}"
p "It took #{(Time.now - timer_start)*1000} milliseconds"