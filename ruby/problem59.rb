# Problem 59
=begin



=end


class Key
	def initialize(array)
		@iteration = 0
		@base = array
	end

	def next()
		base_length = @base.length
		array_index = @iteration%base_length
		num = @base[array_index]
		@iteration += 1
		return num 
	end
end

class Code
	def initialize(array)
		@code = array
	end
	def decrypt_with_key(key)
		if(key.class != Key)
			p "Must provide a key"
			return
		end

		decrypted = []

		@code.each{|num|
			hash = key.next
			decrypted.push((num^hash).chr)
		}

		return decrypted
	end
end

lower_case = ('a'..'z').to_a.join.split('').map(&:ord)
possible_keys = (97..122).to_a.combination(3).to_a

code = Code.new(File.read("cipher1.txt").split(",").map(&:to_i))

test_key = Key.new([103,111,100])
# decrypted = code.decrypt_with_key(test_key).join

possible_keys.each{
	|key| test_key = Key.new(key)
	decrypted = code.decrypt_with_key(test_key).join
	if(decrypted.include?("John"))
		p decrypted
	end
}
sum=0
decrypted.each_byte{|letter| sum+=letter.ord}
puts "The sum of the ASCII values of the letters is #{sum}"
