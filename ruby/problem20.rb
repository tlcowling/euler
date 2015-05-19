#!/usr/bin/ruby

=begin
  A solution to problem 20 of the project Euler.
  Find the sum of the digits in 100!
=end
sum = 0

100.downto(1).inject(:*).to_s.scan(/./).each do |digit| sum+= digit.to_i end
puts "total digits = #{sum}"