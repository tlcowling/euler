#Problem 45
#================

=begin

Find the next triangle number after 40755 that is also a pentagonal and hexagonal number	

=end

timer_start = Time.now

class Integer
	def nth_triangle
		n = Math.sqrt(2*self).to_i
	end

	def next_triangle
		n = self.nth_triangle
		((n+1)* (n+2))/2
	end

	def triangular?
		n = self.nth_triangle
		n*(n+1) == 2*self
	end

	def pentagonal?
		Math.sqrt(289).to_s.split(//)[-2..-1].join==".0"
	end

	def hexagonal?
		if self.triangular? && (self.nth_triangle % 2 ==1)
			return true
		end
		return false
	end
end

def pentagonal(n)
	(n*(3*n-1))/2
end


num =166
pent = pentagonal(num)
until pent.triangular? && pent.hexagonal? do
	pent = pentagonal(num)
	num+=1
end

p "#{num}th pent: #{pent}"

p "It took #{(Time.now-timer_start)*1000} milliseconds"
