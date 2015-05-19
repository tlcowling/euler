#Problem 79
#==============
=begin

A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.

The text file, keylog.txt, contains fifty successful login attempts.

Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.


=end


timer_start = Time.now

class Integer 
	def digits(base=10)
		self.to_s(base).split("").collect{|x| x.to_i(base)}
	end
end

class Array
	def all_permutations
		return [[]] if empty?
		sort.inject([]){|sum,x| sum += (self-[x]).all_permutations.collect{|p| p.unshift(x)}}
	end

	def legal_for?(login)
		reject{|x| not login.include?(x)} == login
	end
end

tokens = File.read("keylog.txt").split("\n").collect{|x| x.to_i.digits}
#min password length is the number of unique numbers in the list
# posspass = tokens.uniq{|x| x}

candidates = [0,1,2,3,6,7,8,9].all_permutations

tokens.each do |login|
	candidates.reject!{|x| not x.legal_for?(login) }
end

puts candidates.inspect

p "It took #{(Time.now - timer_start)*1000} milliseconds"