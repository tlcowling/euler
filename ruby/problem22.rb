total = 0
counter = 0

def calculateWordValue(word)
	letters = ('A'..'Z')
	values = (1..26)
	letterValues = Hash[letters.zip(values)]

	value = 0
	word.split("").each {
		|letter|
		value = value + letterValues[letter].to_i
	}
	value
end

names = IO.readlines('problem22names.txt')
names = names[0].split(",")
names.sort!

names.each { 
	|name|
	counter = counter + 1
	value = calculateWordValue(name) * counter
	total = total+value
}

puts "The greatest value for the names in the list is #{total}"