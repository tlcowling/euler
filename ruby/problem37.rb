#!/usr/bin/env ruby

# Problem 37

=begin

  The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
  
  Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
  
  NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.


=end

require 'prime'

timer_start = Time.now

num_trun_primes = 0
sum = 0

def fully_truncatable?(number)
  test_primes = []
  
  digits = number.to_s.split(//).size
  ints = number.to_s.split(//).map!(&:to_i)
  
  digits.times {
    |x| 
    test_primes.push(ints[-x..digits].join.to_i)
    test_primes.push(ints[0..x].join.to_i)
  }
  test_primes.delete(number)
  
  test_primes.each{
    |test_prime|
    if !test_prime.prime?
      return false
    end
  }

  return !test_primes.empty? && true
end

primes = Prime.take_while{|p| p<1000000}
primes = primes.select{
  |prime|
  primey = prime.to_s.chars.to_a
  !(primey.include?(2.to_s) || primey.include?(5.to_s) || primey.include?(4.to_s) || primey.include?(6.to_s)|| primey.include?(8.to_s) ||  primey.include?(0.to_s)) && prime > 7
}

# These two primes are excluded by my optimisations above
primes = primes << 23
primes = primes << 53

primes.each{
  |prime|
  if fully_truncatable?(prime)
    sum += prime
    num_trun_primes += 1
  end
}

puts "37. #{sum} (#{(Time.now- timer_start)*1000} ms)"
