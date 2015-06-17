#!/usr/bin/env ruby

# Problem 35

=begin

  The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
  
  There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
  
  How many circular primes are there below one million?	

=end

require 'prime'

timer_start = Time.now

primes_below_100 = 13

def all_prime?(array)
  array.each{
    |possible_prime|
    if !possible_prime.prime?
      return false
    end
  }
  return true
end

primes = Prime.take_while{|p| p<550000}

#no number with a 0,2,4,6,8,5 in it can have all permutations prime
primes = primes.select {
  |prime| 
   prime > 7
}	

permutations = []
prime_permutations = primes_below_100

primes.each {
  |prime|
  permutations.clear
  digits = prime.to_s.size - 1
  permutations.push(prime)
  digits.times {
    permutations.push(permutations[-1].to_s.split(//).rotate.join.to_i)	
  }
  
  if all_prime?(permutations)
    prime_permutations+=1
  end
}

p "35. #{prime_permutations} (#{(Time.now- timer_start)*1000} ms)"

#notes to improve
# if instead of using ruby prime generator i implemented one that automatically
# didnt include numbers with a 0,2,4,6,8,5 in them, it would be
# many times faster since its the prime generation that takes
# the bulk of the time

