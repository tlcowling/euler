#!/usr/bin/env ruby

# Problem 36

=begin

  The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
 
  Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
 
  (Please note that the palindromic number, in either base, may not include leading zeros.)

=end

timer_start = Time.now

class String
  def palindrome?
    self == self.reverse
  end
end

sum = 0

(1...1000000).each{
  |x|
  if x.to_s(2).palindrome? && x.to_s.palindrome?
     sum += x
  end
}

puts "36. #{sum} (#{(Time.now-timer_start)*1000} ms)"

