#!/usr/bin/env ruby
#Problem 15
=begin
#starting in the top corner of a 2x2 grid, there are 6 routes(without backtracking), to the bottom right
=end

class Integer
	def choose(k)
		(self - k+1 .. self).inject(1, &:*)/ (2..k).inject(1,&:*)
	end
end

(1..100).each {|number| p number.choose(3)}

# puts 5.choose(3)
