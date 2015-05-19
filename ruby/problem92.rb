#Problem 92
#=============

=begin
	
	A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.

For example,

44  32  13  10  1  1
85  89  145  42  20  4  16  37  58  89

Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.

How many starting numbers below ten million will arrive at 89?

=end

timer_start = Time.now

class Integer
	def next_in_chain
		digits = self.to_s.chars.map(&:to_i)
		digits.map!{|digit| digit**2}
		digits.inject(:+)
	end
end

count = 0

(1..10000000).each{|test|
	p test
	temp = test
	until temp == 1 || temp == 89 do
		temp = temp.next_in_chain
		if(temp == 89) then count += 1 end
	end
}

p "There are #{count} numbers under 10 million whose chain ends with 89"

p "It took #{(Time.now-timer_start)*1000} milliseconds to run this"