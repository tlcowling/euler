#Problem 46
#=============

=begin

It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9 = 7 + 212
15 = 7 + 222
21 = 3 + 232
25 = 7 + 232
27 = 19 + 222
33 = 31 + 212

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
	
=end

require 'mathn'

class Integer
	def composite?
		return !self.prime? && self != 1
	end

	def goldbach?
		Prime.each {
			|p| return false if p >= self

			t,i = 1,1

			while t<= self
				t = p + (2* (i*i))

				return true if t == self
				i+=1
			end
		}
	end
end

answer, i =0, 1

while answer == 0
	answer = i if i.composite? && !i.goldbach?
	i+=2 #odd numbers
end

puts answer