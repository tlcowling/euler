#!/usr/bin/env ruby

# Problem62

=begin
  The 5-digit number, 16807=75, is also a fifth power. Similarly, the 9-digit number, 134217728=89, is a ninth power.
  How many n-digit positive integers exist which are also an nth power?
  
  
  1
  
  2^1
  2^2 X
  
  3^1
  3^2 X
  
  4^1
  4^2
  4^3 X
  
  5^1
  5^2	
  5^3 
  5^4 X
  
  6^1
  6^2
  6^3
  6^4
  6^5 X

=end

timer_start = Time.now

total = 0
such_numbers = []

def num_digits?(num)
  num.to_s.size
end

(1..9).each{ |base|
  (1..21).each{ |power|
    temp = base**power
    if power==num_digits?(temp) then total+=1 
      such_numbers.push(base.to_s + " ^ "+power.to_s + " = " +temp.to_s)
    end
  }
}

puts "63. #{total} (#{(Time.now-timer_start)*1000} ms)"
#p "FYI, these are:"
#such_numbers.each{|num| p num}
#p "It took  milliseconds"
