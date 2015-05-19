#problem 42

require 'mathn'

class Triangle
	def self.take(n)
		triangles = []
		i=1
		until i>n do
			triangles.push(at(i))
			i+=1
		end
		triangles
	end

	def self.at(n)
		(1/2)*(n)*(n+1)
	end
end

class Integer
	def triangle?
		n = self.nth_triangle
		n*(n+1) == 2*self
	end

	def nth_triangle
		n = Math.sqrt(2*self).to_i
	end

	def next_triangle
		n = self.nth_triangle
		((n+1)* (n+2))/2
	end
end

class String
	def letter_value
		sum = 0
		self.downcase.each_byte{|c| sum+=c.ord - 96}
		sum
	end
end

triangular_word_count = 0
contents = File.read('words.txt').gsub!("\"","").split(",")
contents.each{|word| if word.letter_value.triangle? then triangular_word_count+=1 end}

p "The total number of triangular words in the words.txt file is #{triangular_word_count}"