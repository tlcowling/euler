#Problem 4
#=====================

=begin

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

=end
timer_start = Time.now

class Fixnum
  def palindrome?
    str = self.to_s
    return str.reverse == str
  end
end

j = 999

answer = 0

while j > 100 do
  999.downto(100) do |i|
    #p "#{i} x #{j}"
    test = i * j
    answer = test if test.palindrome? and test > answer
  end
  j -= 1
end


puts answer
puts "This took #{(Time.now-timer_start)*1000} milliseconds"
