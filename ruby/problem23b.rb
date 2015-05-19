# Euler 23
# http://projecteuler.net/index.php?section=problems&id=23
# A perfect number is a number for which the sum of its
# proper divisors is exactly equal to the number. For
# example, the sum of the proper divisors of 28 would be
# 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a
# perfect number.
#
# A number n is called deficient if the sum of its proper
# divisors is less than n and it is called abundant if
# this sum exceeds n.
#
# As 12 is the smallest abundant number,
# 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be
# written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers
# greater than 28123 can be written as the sum of two
# abundant numbers. However, this upper limit cannot be
# reduced any further by analysis even though it is known
# that the greatest number that cannot be expressed as the
# sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot
# be written as the sum of two abundant numbers.
timer_start = Time.now

class Integer
  def divisors_sum
    n = self

    # Guard against 1
    return 0 if n == 1

    sum = 1
    sqrt = Math.sqrt(n)

    # Self is not considered a factor and
    # only consider the sqrt a factor once
    # Eg: 4 = 1+2 but not 1+2+2+4
    (2..sqrt).each do |i|
      if n % i == 0
        sum += n / i if i != sqrt
        sum += i
      end
    end

    sum
  end

  def abundant?
    self < divisors_sum
  end
end

max = 28123

an = (1..max).select { |n| n.abundant? }

ans = []
an.each do |x|
  # I thought that reducing the loop would
  # limit the number of iterations and produce the
  # same result. That's not the case? Why not?
  # What am I missing?
  #(x..an.length-1).each do |y|
  an.each do |y|
    s = x+y
    break if s > max
    ans << s
    # Alternative
    # ans.push(s) if s < max
  end
end

# This routine should provide the same result as the
# nest loop above, but it's terrible slow and not
# filtered by s < max. Cool though.
# ans = an \
#  .combination(2) \
#  .map{|x| x[0] + x[1]}

# I'm pretty sure this idea, for me, originated from
# my time spent with Python. Here we subtract one
# array of numbers, our abundant sums array, from
# another,(1..max).to_a to get all numbers which can't
# be made up of the sum of two abundant numbers. Slick.
# http://ruby-doc.org/core/classes/Array.html#M002211
not_ans = (1..max).to_a - ans
puts not_ans.inject(0) { |agg, n| agg + n }

# Tried the following two routines and though
# I really think they should work but they took
# longer than I could wait to process.
# puts (1..max) \
#  .select { |n| !ans.include?(n)} \
#  .inject { |agg, n| agg + n }

# total = 0
# max.times do |i|
#   total += i if !ans.include?(i+1)
# end
# puts total

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"
