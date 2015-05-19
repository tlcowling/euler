# class TriangleNumber
# 	attr_accessor :value

# 	def initialize(value)
# 		@value = value
# 	end

# 	def nth_number(n)
# 		(n*(n+1))/2
# 	end
	
# 	def self.take(n)
# 		i=1
# 		numbers = []
# 		until i==n+1 
# 			numbers << nth_number(i)
# 			i+=1
# 		end
# 		numbers
# 	end

# 	def triangle?
# 		sqrt = n_for_triangle(value)
# 		sqrt*(sqrt+1) === value*2
# 	end

# 	def next
# 		n = n_for_triangle(value)
# 		nth_number(n+1)
# 	end

# 	private
# 	def n_for_triangle(value)
# 		Math.sqrt(value*2).to_i
# 	end
# end

# class PentagonalNumber
# 	attr_accessor :value

# 	def initialize(value)
# 		@value = value
# 	end

# 	def nth_number(n)
# 		(n*(3*n-1))/2
# 	end
	
# 	def self.take(n)
# 		i=1
# 		numbers = []
# 		until i==n+1 
# 			numbers << nth_number(i)
# 			i+=1
# 		end
# 		numbers
# 	end

# 	def pentagonal?
# 		sqrt = n_for_triangle(value)
# 		sqrt*(sqrt+1) === value*2
# 	end

# 	def next
# 		n = n_for_triangle(value)
# 		nth_number(n+1)
# 	end

# 	private
# 	def n_for_triangle(value)
# 		Math.sqrt(value*2).to_i
# 	end


# end

# class HexagonalNumber
# 	attr_accessor :value

# 	def initialize(value)
# 		@value = value
# 	end

# 	def nth_number(n)
# 		(n*(2*n-1))
# 	end
	
# 	def self.take(n)
# 		i=1
# 		numbers = []
# 		until i==n+1 
# 			numbers << nth_number(i)
# 			i+=1
# 		end
# 		numbers
# 	end

# 	def next
# 		n = n_for_triangle(value)
# 		nth_number(n+1)
# 	end

# end

# # p TriangleNumber.take(285)
# # p PentagonalNumber.take(285)
# # p HexagonalNumber.take(285)

def triagonal_number(n)
	(n*(n+1))/2
end

def hexagonal?(number)
	triangle?(number)
end

def pentagonal?(number)
	square = number*24 + 1
	Math.sqrt(square).to_s[-2..-1]==".0"
end

def triangle?(number)
	sqrt = Math.sqrt(2*number).to_i
	sqrt*(sqrt+1) === number*2
end

def hexagonal_number(n)
	n*(2*n - 1)
end


i=286
number = triagonal_number(i)

until hexagonal?(number) && pentagonal?(number)
	p number = triagonal_number(i)
	p i+=1
end

p triagonal_number(i)
