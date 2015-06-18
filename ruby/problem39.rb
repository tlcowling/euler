#!/usr/bin/env ruby

#Problem 39

=begin

If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p  1000, is the number of solutions maximised?

=end

timer_start = Time.now

counts = {}
counts.default = 0

(1..499).each do |a|
  (a..499).each do |b|
    break if a + b > 500
    c = Math.sqrt(a**2 + b**2)
    next unless c.denominator == 1
    counts[a + b + c] += 1
  end
end

sorted = counts.sort { |a, b| a[1] <=> b[1] }

answer = sorted.last[0]
time = (Time.now - timer_start)*1000

puts "39. #{answer} (#{time} ms)"
