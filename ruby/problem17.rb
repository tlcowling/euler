#!/usr/bin/ruby

=begin
  If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

  If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

  NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
=end
class NumberNamer
  @@words = {
  1=> "one",
  2=> "two",
  3=> "three",
  4=> "four",
  5=> "five",
  6=> "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen",
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety",
  100 => "one hundred",
  1000 => "one thousand",
  0 => "" }

  def initialize(number)
    raise unless number.is_a?(Numeric)
    @x = number
  end

  def inWords
    #word is in table check
    if @@words[@x] != nil
      return @@words[@x]
    end  

    digits = @x.to_s.split("")

    #double digit
    tens_key = digits[-2].to_i*10
    units_key = digits[-1].to_i

    if tens_key == 0 
      two_digit_number = "#{@@words[units_key]}"
    elsif tens_key == 10
      two_digit_number = "#{@@words[digits[(-2..-1)].join.to_i]}"
    else
      two_digit_number = "#{@@words[tens_key]}-#{@@words[units_key]}"
    end

    if digits.length == 2
      return two_digit_number
    else
      hundreds_key = digits[-3].to_i
      if tens_key == 0 && units_key == 0 
        return "#{@@words[hundreds_key]} hundred"
      else
        return "#{@@words[hundreds_key]} hundred and #{two_digit_number}"
      end
    end    
  end
end

def number_letters(str)
  new_str = ""
  str.each_byte do |byte|
    new_str << byte.chr unless byte.chr == '-'
  end
  new_str.gsub(/\s+/, "").length
end

count = 0

(1..1000).each {
  |number|
  count = count + number_letters(NumberNamer.new(number).inWords)
}

p "The sum of all the letters in the numbers from 1 to 1000 is #{count}"
