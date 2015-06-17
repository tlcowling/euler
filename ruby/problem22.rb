#!/usr/bin/env ruby
# Problem 22

=begin

  Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

  For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

  What is the total of all the name scores in the file? 

=end

timer_start = Time.now

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

puts "22. #{total} (#{(Time.now - timer_start)*1000} ms)"
